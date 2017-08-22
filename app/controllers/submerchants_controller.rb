class SubmerchantsController < ApplicationController

  def new
  end

  def create

    merchant_account_params = {
      :individual => {
        :first_name => params[:merchant_account_params][:first_name],
        :last_name => params[:merchant_account_params][:last_name],
        :email => params[:merchant_account_params][:email],
        :phone => params[:merchant_account_params][:phone],
        :date_of_birth => params[:merchant_account_params][:date_of_birth],
        :ssn => params[:merchant_account_params][:ssn],
        :address => {
          :street_address => params[:merchant_account_params][:street_address],
          :locality => params[:merchant_account_params][:locality],
          :region => params[:merchant_account_params][:region],
          :postal_code => params[:merchant_account_params][:postal_code]
        }
      },
      :business => {
        :legal_name => params[:merchant_account_params][:legal_name],
        :dba_name => params[:merchant_account_params][:dba_name],
        :tax_id => params[:merchant_account_params][:tax_id],
        :address => {
          :street_address => params[:merchant_account_params][:business_street],
          :locality => params[:merchant_account_params][:business_locality],
          :region => params[:merchant_account_params][:business_region],
          :postal_code => params[:merchant_account_params][:business_postal_code]
        }
      },
      :funding => {
        :descriptor => params[:merchant_account_params][:descriptor],
        :destination => Braintree::MerchantAccount::FundingDestination::Bank,
        :account_number => params[:merchant_account_params][:account_number],
        :routing_number => params[:merchant_account_params][:routing_number]
      },
      :id => params[:merchant_account_params][:id],
      :master_merchant_account_id => "busbysolutionsinc", #your master merchant ID goes here
      :tos_accepted => params[:merchant_account_params][:tos]
    }
    puts params
    puts merchant_account_params
    result = Braintree::MerchantAccount.create(merchant_account_params)

    if result.success?
      puts result.merchant_account.status
      redirect_to submerchant_path(result.merchant_account.id)
    else
      error_messages = result.errors.map { |error| "Error: #{error.code}: #{error.message}"}
      flash[:error] = error_messages
      puts result

      result.errors.each do |error|
        puts error.attribute
        puts error.code
        puts error.message
      end
      render 'new'
    end

  end

  def show
    @submerchant = Braintree::MerchantAccount.find(params[:id])
  end
end
