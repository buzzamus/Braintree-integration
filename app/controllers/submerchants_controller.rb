class SubmerchantsController < ApplicationController

  def new

    submerchant = {
      :id => params[:id],
      :first_name => params[:first_name]
    }


    result = Braintree::MerchantAccount.create(merchant_account_params)

  end


end
