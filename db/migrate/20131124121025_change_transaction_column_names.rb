class ChangeTransactionColumnNames < ActiveRecord::Migration
  def change
    rename_column :transactions, :duedate, :due_date
    rename_column :transactions, :accountcode, :account_code
    rename_column :transactions, :type, :xero_type
    add_column :transactions, :xero_invoice_id, :string
    add_column :transactions, :reference, :string
    add_column :transactions, :invoice_number, :string
  end
end
# "fund", "type", "name", "date", "duedate", "description", "quantity", "unit_amount", "accountcode", "currency_code", "currency_rate"