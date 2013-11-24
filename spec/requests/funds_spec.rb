require 'spec_helper'

describe "Funds" do
  describe "GET /funds" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit funds_path
       page.should have_content('Listing fund')
    end
  end
end
