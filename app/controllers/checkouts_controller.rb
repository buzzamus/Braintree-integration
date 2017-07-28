class CheckoutsController < ApplicationController

  def new
    @client_token = Braintree::ClientToken.generate
  end

  def create
    amount = "10.00"
     nonce = params["payment_method_nonce"]

     result = Braintree::Transaction.sale(
       amount: amount,
       payment_method_nonce: nonce,
       :options => {
         :submit_for_settlement => true
       }
     )

     puts result
     puts result.params
     puts result.errors

  end

end
