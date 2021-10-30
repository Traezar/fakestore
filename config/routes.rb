
Rails.application.routes.draw do
  resources :orders, execpt: [:index]
  scope :admin do
    resources :products , only: [:create,:update]
  end
  resources :products, only: [:index,:show]
  get     'cart/:id',         to: 'cart#show'
  post    'add_to_cart',      to: 'cart#add_to_cart'
  post    'remove_from_cart', to: 'cart#remove_from_cart'
  delete  'bookmark',         to:  'bookmarks#delete_bookmark'
  post    'bookmark',         to:  'bookmarks#add_bookmark'
  post    'product_reviews',  to:  'product_reviews#add_product_reviews'
  delete  'product_reviews',  to:  'product_reviews#delete_product_reviews'
end
