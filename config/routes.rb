Rails.application.routes.draw do
  resources :customers
  root :to => 'home#index'
  mount ShopifyApp::Engine, at: '/'
  post '/webhooks/customers/receive_customer_params', to: 'webhooks/customers#receive_customer_params'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
