class AddAddress1ToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :address_1, :string
  end
end
