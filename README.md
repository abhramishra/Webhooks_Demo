# README

**************************************************************
Customer create webhooks -  When a new customer create an account in your store, using web hooks it will show in your rails app (embedded app).

**************************************************************
Step 1: Create a rails app and configure all the necessary thing to connect your app to Shopify app.

	$ rails new WebhooksDemo -d postgresql
	$ rails db:create
	$ rails db:migrate
	$ rails g shopify_app —api_key <YOUR APP API KEY> —secret <YOUR APP SECRET KEY>

Step 2: go to controller and create a new folder called “webhooks” . Inside this folder create one controller name “customers_controller.rb”.
	   Add these lines of code inside customers_controller.rb  (located in app/controller/webhooks/customers_controller.rb)

	class Webhooks::CustomersController < ApplicationController

    # basic setup for webhooks -----------
    #include Webhooks::WebhookVerification
    skip_before_action :verify_authenticity_token, raise: false
    skip_before_action :verify_webhooks, raise: false
    #  include ApplicationHelper

    # defind method for creating new customer -----------
    def receive_customer_params
        params.permit!
        head :ok
        @customer = Customer.new
        @customer.info = params     # storing json data in info column
        @customer.shopify_customer_id = params["id"]
        @customer.save
        #binding.pry
    end

end
 





Step 3: Go to shopify_app.rb and add this code there
	
	config.scope = "read_products, read_customers"
	
	config.webhooks = [
    {topic: 'customers/create', address: "https://c72493d4.ngrok.io/webhooks/customers/receive_customer_params"}
  ]

	note: ‘customer/create’ this customer create webhooks you can check here - https://help.shopify.com/en/api/reference/events/webhook

Step 4: Go to routes.rb and add this code

	post '/webhooks/customers/receive_customer_params', to: 'webhooks/customers#receive_customer_params'

Step 5: Run this command in your terminal to scafold

	$ rails g scaffold Customer info:json shopify_customer_id:string
	
  Inside the app/controller/customers_controller.rb edit this code

	class CustomersController < ShopifyApp::AuthenticatedController



Step 6: In app/view/customers/index.html.erb edit these line of codes

	<tr>
        <td><%= customer.info["email"] %></td>  # fetching customer email from hash data
        <td> <%= customer.info["first_name"] %></td>
        <td><%= customer.info["last_name"] %></td>
        <td><%= link_to 'Show', customer %></td>
        <td><%= link_to 'Edit', edit_customer_path(customer) %></td>
        <td><%= link_to 'Destroy', customer, method: :delete, data: { confirm: 'Are you sure?' } %></td>
      </tr>




