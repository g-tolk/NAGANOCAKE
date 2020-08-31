class AddFamilyNameToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :family_name, :string
  end
end
