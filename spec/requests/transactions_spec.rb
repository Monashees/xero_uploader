require 'spec_helper'

describe "Transactions" do
  describe "GET /transactions" do
    it "should load" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit transactions_path
      page.should have_content('Listing transactions')
    end
    
    it "should have an import button" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit transactions_path
      page.should have_button('Import')
    end
    
  end
end
