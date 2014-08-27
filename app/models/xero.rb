class Xero
  extend ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations
  
  def initialize(key, secret)
    @x = Xeroizer::PrivateApplication.new(key, secret, "#{XERO_CONFIG['cert_path']}" )
    @x = Xeroizer::PrivateApplication.new(key, secret, "public/privatekey.pem" )
  end
  
  def send(transactions)
    inv = @x.Invoice
    @batch = inv.batch_save do
      transactions.each do |t|
        this_invoice = {type: t.xero_type, invoice_number: t.invoice_number, reference: t.reference, contact: {name: t.name}, date: t.date, due_date: t.due_date, line_amount_types: 'NoTax', line_items: { description: t.description, quantity: t.quantity, unit_amount: t.unit_amount, account_code: t.account_code }, currency_code: t.currency_code, currency_rate: t.currency_rate }
        @trans = @x.Invoice.build(this_invoice)
      end
    end
    # xxx
  end
  
end