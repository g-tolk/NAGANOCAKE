class RemoveFamilyNemeFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :family_neme, :string
  end
end
