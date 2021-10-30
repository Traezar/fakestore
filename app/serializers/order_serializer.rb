class OrderSerializer < ActiveModel::Serializer
  attributes :id, , :total
  has_many :order_items

  def total
    @object.total
  end
  class OrderItemSerializer < ActiveModel::Serializer
    attributes :name, :category, :summary, :price, :quantity
    
    def name
      p @object     
      @object.product.name
    end
    def category; @object.product.category; end
    def summary;  @object.product.summary; end
    def price;    @object.product.price; end
  end
end
