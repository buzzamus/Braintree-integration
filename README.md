# README

My Braintree Marketplace Sandbox Integration

* Ruby version 2.4.0

* Rails version 5.1

* System dependencies
  * BT JS SDK version 3.18.0
  * BT Ruby SDK version 2.76.0

* Configuration
  * run `bundle install`
  * create an **application.yml** file within the config folder(if it doesn't automatically install from figaro gem)
  * in application.yml copy and paste the following with your Braintree credentials:

    ```ruby
     BRAINTREE_MERCHANT_ID: 'YOURMERCHANTID'
     BRAINTREE_PUBLIC_KEY: 'YOURPUBLICKEY'
     BRAINTREE_PRIVATE_KEY: 'YOURPRIVATEKEY'
     ```
  
  *  in the `submerchants_controller.rb` file enter in your master merchant ID under the value of the        `:master_merchant_account_id` hash
