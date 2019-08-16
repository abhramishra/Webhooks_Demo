ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = '8a6771204ae1cda6f92cc998d50f60e8' #ENV['SHOPIFY_API_KEY']
  config.secret = '4489b78fcbac9db3c36f7a7c294af670' #ENV['SHOPIFY_API_SECRET']
  config.old_secret = ""
  config.scope = "read_products, read_customers" # Consult this page for more scope options:
                                 # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = true
  config.after_authenticate_job = false
  config.api_version = "2019-07"
  config.session_repository = Shop

  config.webhooks = [
    {topic: 'customers/create', address: "https://c72493d4.ngrok.io/webhooks/customers/receive_customer_params"}
  ]
end
