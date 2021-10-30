
Rails.application.routes.draw do
  resources :orders, only: [:create,:update,:destroy,:show]
  scope :admin do
    resources :products , only: [:create,:update]
  end
  resources :products, only: [:index,:show]
  get     'cart/:id',         to: 'cart#show'
  post    'add_to_cart',      to: 'cart#add_to_cart'
  post    'remove_from_cart', to: 'cart#remove_from_cart'
  post    'bookmark',         to:  'bookmarks#add_bookmark'
  post    'product_reviews',  to:  'product_reviews#add_product_reviews'
  delete  'bookmark/:id',         to:  'bookmarks#delete_bookmark'
  delete  'product_reviews/:id',  to:  'product_reviews#delete_product_reviews'
end
