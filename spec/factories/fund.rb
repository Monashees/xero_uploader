FactoryGirl.define do
  factory :fund do
    sequence(:name) { |n| "My VC Fund #{n}"}
    currency "USD"
    sequence(:code) { |n| "VC#{n}"}
    xero_key 'KEY'
    xero_secret 'SECRET'
  end  
end
