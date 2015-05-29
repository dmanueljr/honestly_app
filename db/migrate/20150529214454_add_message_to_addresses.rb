class AddMessageToAddresses < ActiveRecord::Migration
  def change
    add_reference :addresses, :message, index: true
    add_foreign_key :addresses, :messages
  end
end
