class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer :order_id, null: false
      t.integer :product_id, null: false
      t.integer :quantity, null: false
      t.integer :non_taxed_price, null: false
      t.integer :product_status, null: false,default: true

      t.timestamps
    end
  end
end
