class RemoveKanaFamilyNemeFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :kana_family_neme, :string
  end
end
