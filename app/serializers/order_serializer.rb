class OrderSerializer < ActiveModel::Serializer
  attributes :id, :order_items, :total


  def total
    @object.total
  end
  class OrderItemSerializer < ActiveModel::Serializer
    attributes :name, :category, :summary, :price, :quantity
  
    def name;     @object.item.name;end
    def category; @object.item.category; end
    def summary;  @object.item.summary; end
    def price;    @object.item.price; end
  end
end
