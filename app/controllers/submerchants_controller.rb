class SubmerchantsController < ApplicationController

  def new
    #placeholder, until API documentation reviewed
    merchant_account_params = {
      :firstname => :firstname
    }

    result = Braintree::MerchantAccount.create(merchant_account_params)
  end

  private

end
