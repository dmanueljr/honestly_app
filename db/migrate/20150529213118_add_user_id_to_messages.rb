class AddUserIdToMessages < ActiveRecord::Migration
  def change
    add_reference :messages, :user_id, index: true
    add_foreign_key :messages, :user_ids
  end
end
