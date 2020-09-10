class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :member_id, null: false
      t.integer :postage, null: false
      t.integer :payment_amount, null: false
      t.boolean :payment_method, null: false, default: true
      t.integer :order_status, null: false, default: 0
      t.string :receiver, null: false
      t.string :postal_code, null: false
      t.string :address, null: false

      t.timestamps
    end
  end
end
