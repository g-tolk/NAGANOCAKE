class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.boolean :valid_status, default: true, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
