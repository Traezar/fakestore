class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item,foreign_key: "product_id", class_name: :Product

end
