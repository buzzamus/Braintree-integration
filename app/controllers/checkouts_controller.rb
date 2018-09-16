class CheckoutsController < ApplicationController

  def new
    @client_token = Braintree::ClientToken.generate
    @amount = "$10.00"
  end

  def show
    @transaction = Braintree::Transaction.find(params[:id])
  end

  def create
    @amount = "10.00"
    nonce = params["payment_method_nonce"]

    result = Braintree::Transaction.sale(
      amount: @amount,
      payment_method_nonce: nonce,
      :options => {
        :submit_for_settlement => true,
        :three_d_secure => {
          :required => true
        }
      }
    )

    if result.success? || result.transaction
      redirect_to checkout_path(result.transaction.id)
    else
      error_messages = result.errors.map { |error| "Error: #{error.code}: #{error.message}"}
    puts result
    puts result.params
    end

  end

end
