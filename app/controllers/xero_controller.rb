class XeroController < ApplicationController
  
  def send_to
    funds = Transaction.select(:fund_id).uniq.pluck(:fund_id)
    funds.each do |f|
      fund = Fund.find f
      saved = fund.xero.send(fund.transactions.all)
    end
    redirect_to transactions_path, notice: "Transactions sent to Xero."    
  end
  
  
end