class AddKanaFamilyNameToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :kana_family_name, :string
  end
end
