class RemoveMessageIdIdFromAddresses < ActiveRecord::Migration
  def change
    remove_column :addresses, :message_id_id, :integer
  end
end
