class DeliverysController < ApplicationController

  def new
    @client_token = Braintree::ClientToken.generate
    @deliveryamount = "$13.00"
  end

  def show
    @transaction = Braintree::Transaction.find(params[:id])
  end

  def create
    @deliveryamount = "13.00"
    nonce = params["payment_method_nonce"]

    result = Braintree::Transaction.sale(
      amount: @deliveryamount,
      payment_method_nonce: nonce,
      merchant_account_id: "mehpizzastore_42", # <---- put your sub-merchant ID here
      service_fee_amount: "3.00",
      :options => {
        :submit_for_settlement => true
      }
    )

    if result.success? || result.transaction
      redirect_to delivery_path(result.transaction.id)
    else
      error_messages = result.errors.map { |error| "Error: #{error.code}: #{error.message}"}

    puts result
    puts result.params
    end

  end

end
