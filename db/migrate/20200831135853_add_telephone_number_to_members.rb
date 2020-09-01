class AddTelephoneNumberToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :telephone_number, :string
  end
end
