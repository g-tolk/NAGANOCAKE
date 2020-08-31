class RemoveKanaFirstNemeFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :kana_first_neme, :string
  end
end
