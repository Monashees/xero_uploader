class Transaction < ActiveRecord::Base
  belongs_to :fund

  validates :fund, presence: true
  validates :unit_amount, :numericality => { :greater_than_or_equal_to => 0 }

  def self.accessible_attributes
    [ "xero_type", "name", "date", "due_date", "description", "quantity", "unit_amount", "account_code", "currency_code", "currency_rate", "reference", "invoice_number"]
  end
  # "fund",
end
