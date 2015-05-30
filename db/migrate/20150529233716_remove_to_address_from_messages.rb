class RemoveToAddressFromMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :to_address, :string
  end
end
