class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :user_id
      t.string :to_address
      t.string :to_name
      t.text :message
      t.boolean :is_public

      t.timestamps null: false
    end
  end
end
