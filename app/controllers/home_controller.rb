# frozen_string_literal: true

class HomeController < AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @webhooks = ShopifyAPI::Webhook.find(:all)
    
    #binding.pry
    # new_webhook = ShopifyAPI::Webhook.create({
    #   topic: "customers/create",
    #   address: "https://c72493d4.ngrok.io/webhooks/customers/receive_customer_params", # substitute url with your endpoint
    #   format: "json"
    # })
    # binding.pry
  end
end
