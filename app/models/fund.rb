class Fund < ActiveRecord::Base
  has_many :transactions

  def connect_to_xero
    @xero = Xero.new(self.xero_key,self.xero_secret)
  end

  def xero
    @xero || self.connect_to_xero
  end


end
