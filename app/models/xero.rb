class Xero
  extend ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations
  
  def initialize(key, secret)
    x = Xeroizer::PrivateApplication.new(key, secret, XERO_CONFIG['cert_path'])
  end
end