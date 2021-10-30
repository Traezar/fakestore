class OrderSerializer < ActiveModel::Serializer
  attributes :id, :order_items, :total


  def total
    @object.total
  end
  class OrderItemSerializer < ActiveModel::Serializer
    attributes :name, :category, :summary, :price, :quantity

    def name; product.name;end
    def category; product.category; end
    def summary; product.summary; end
    def price; product.price; end
  end
end
