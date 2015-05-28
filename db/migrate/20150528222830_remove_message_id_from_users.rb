class RemoveMessageIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :message_id, :string
  end
end
