class RemoveNemeFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :neme, :string
  end
end
