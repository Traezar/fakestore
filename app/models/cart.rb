class Cart < ApplicationRecord
  has_many :cart_items, dependent: :delete_all
  has_many :products, through: :cart_items, dependent: :delete_all
  belongs_to :user
  validates_uniqueness_of :user_id
  def total
    cart_items.reduce(0) {|sum,i|  sum += (i.product.price.to_f * i.quantity.to_f)}.round(2)
  end
end