class ChangeCartTable < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|   
      t.timestamps
    end
    
    create_table :cart_items do |t|
      t.timestamps
      t.integer :quantity
    end
    add_reference(:carts,:user,type: :int, foreign_key: true)
    add_reference(:cart_items,:product,type: :int,foreign_key: true)
    add_reference(:cart_items,:cart,foreign_key: true)
  end
end
