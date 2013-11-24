class Transaction < ActiveRecord::Base
  belongs_to :fund

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Csv.new(file.path, nil, :ignore)
    when '.xls' then Excel.new(file.path, nil, :ignore)
    when '.xlsx' then Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
  
  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      transaction = find_by :id, row["id"] || new
      transaction.attributes = row.to_hash.slice(*accessible_attributes)
      transaction.save!
    end
  end
  
  def self.accessible_attributes
    [ "xero_type", "name", "date", "due_date", "description", "quantity", "unit_amount", "account_code", "currency_code", "currency_rate", "reference", "invoice_number"]
  end
  # "fund",
end
