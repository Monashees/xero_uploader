json.array!(@funds) do |fund|
  json.extract! fund, :name, :code, :xero_key, :xero_secret
  json.url fund_url(fund, format: :json)
end
