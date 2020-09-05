class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :genre_id, null: false
      t.integer :non_taxed_price, null: false
      t.string :image_id
      t.boolean :sale_status, null: false

      t.timestamps
    end
  end
end
