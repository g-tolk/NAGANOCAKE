class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.integer :member_id, null: false
      t.string :name, null: false
      t.string :postal_code, null: false,default: "000-0000"
      t.string :address, null: false

      t.timestamps
    end
  end
end
