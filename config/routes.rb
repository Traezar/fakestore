
Rails.application.routes.draw do
  resources :orders, only: [:create,:update,:destroy,:show]
  scope :admin do
    resources :products , only: [:create,:update]
  end
  resources :products, only: [:index,:show]
  get     'carts/:id',            to: 'carts#show'
  post    'add_to_cart',          to: 'carts#add_to_cart'
  post    'remove_from_cart',     to: 'carts#remove_from_cart'
  post    'checkout_cart/:id',    to: 'carts#checkout'
  post    'bookmark',             to: 'bookmarks#add_bookmark'
  post    'product_reviews',      to: 'product_reviews#add_product_reviews'
  delete  'bookmark/:id',         to: 'bookmarks#delete_bookmark'
  delete  'product_reviews/:id',  to: 'product_reviews#delete_product_reviews'
end
