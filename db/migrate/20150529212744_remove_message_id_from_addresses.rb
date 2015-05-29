class RemoveMessageIdFromAddresses < ActiveRecord::Migration
  def change
    remove_column :addresses, :message_id, :string
  end
end
