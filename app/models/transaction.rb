class Transaction < ActiveRecord::Base
  belongs_to :fund

  validates :fund, presence: true

  def self.accessible_attributes
    [ "xero_type", "name", "date", "due_date", "description", "quantity", "unit_amount", "account_code", "currency_code", "currency_rate", "reference", "invoice_number"]
  end
  # "fund",
end
