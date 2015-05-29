class AddMessageIdToAddresses < ActiveRecord::Migration
  def change
    add_reference :addresses, :message_id, index: true
    add_foreign_key :addresses, :message_ids
  end
end
