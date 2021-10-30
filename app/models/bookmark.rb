class Bookmark < ApplicationRecord
  belongs_to :product, class_name: "product", foreign_key: "product_id"
  belongs_to :user
end