class AddTelephoneNumberToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :telephone_number, :string, null: false,default: "000-0000-0000"
  end
end
