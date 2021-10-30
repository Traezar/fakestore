class OrderSerializer < ActiveModel::Serializer
  attributes :id, :order_items, :total


  def total
    @object.total
  end
  class OrderItemSerializer < ActiveModel::Serializer
    attributes :name, :category, :summary, :price, :quantity
  
    def name;     @object.product.name;end
    def category; @object.product.category; end
    def summary;  @object.product.summary; end
    def price;    @object.product.price; end
  end
end
