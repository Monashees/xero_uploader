json.array!(@transactions) do |transaction|
  json.extract! transaction, :fund, :invoice_number, :type, :name, :date, :due_date, :description, :quantity, :unit_amount, :account_code, :currency_code, :currency_rate, :xero_invoice_id, :reference
  json.url transaction_url(transaction, format: :json)
end
