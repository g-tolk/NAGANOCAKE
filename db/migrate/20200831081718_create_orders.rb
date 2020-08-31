class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.integer :postage
      t.integer :payment_amount
      t.integer :payment_method
      t.integer :order_status
      t.string :receiver
      t.string :postal_code
      t.string :address

      t.timestamps
    end
  end
end
