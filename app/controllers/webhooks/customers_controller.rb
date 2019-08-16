class Webhooks::CustomersController < ApplicationController

    # basic setup for webhooks
    #include Webhooks::WebhookVerification
    skip_before_action :verify_authenticity_token, raise: false
    skip_before_action :verify_webhooks, raise: false
    #  include ApplicationHelper

    def receive_customer_params
        params.permit!
        head :ok
        @customer = Customer.new
        @customer.info = params
        @customer.shopify_customer_id = params["id"]
        @customer.save
        #binding.pry
    end

end