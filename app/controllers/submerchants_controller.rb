class SubmerchantsController < ApplicationController

  def new

    merchant_account_params = {
      :id => id,
      :first_name => first_name
    }


    result = Braintree::MerchantAccount.create(merchant_account_params)

  end


end
