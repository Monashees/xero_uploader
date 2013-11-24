class TransactionImport
  # switch to ActiveModel::Model in Rails 4
  extend ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :file
  
  # require 'roo'

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def save
    if imported_transactions.map(&:valid?).all?
      imported_transactions.each(&:save!)
      true
    else
      imported_transactions.each_with_index do |transaction, index|
        transaction.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
      false
    end
  end

  def imported_transactions
    @imported_transactions ||= load_imported_transactions
  end

  def load_imported_transactions
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      # transaction = Transaction.find_by_id(row["id"]) || Transaction.new
      transaction = Transaction.new
      transaction.attributes = row.to_hash.slice(*Transaction.accessible_attributes)
      fund = Fund.find_by name: row["fund"]
      if fund.nil?
        transaction.fund_id = nil
      else
        transaction.fund_id = fund.id
      end
      # xxx
      Rails.logger.debug "Attributes -> #{transaction.attributes}"
      transaction
    end
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path, {})
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end

