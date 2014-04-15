SimpleTransactionService::Application.routes.draw do
  resource :status, only: [:show], controller: 'status'

  resources :simple_sales, only: [:index, :show, :create]
  resources :modified_sales, only: [:index, :show, :create]

  root to: 'home#index'
end
