class RemoveFirstNemeFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :first_neme, :string
  end
end
