class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :introduction
      t.integer :genre_id
      t.integer :non_taxed_price
      t.string :image_id
      t.boolean :sale_status

      t.timestamps
    end
  end
end
