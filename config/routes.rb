Rails.application.routes.draw do
  resources :orders
  scope :admin do
    resources :products 
  end
  resources :products, only: [:index,:show]
  get 'cart/:id', to: 'cart#show'
  post 'add_to_cart', to: 'cart#add_to_cart'
  post 'remove_from_cart', to: 'cart#remove_from_cart'
end
