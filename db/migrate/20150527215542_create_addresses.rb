class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :message_id
      t.string :addres_1
      t.string :addres_2
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps null: false
    end
  end
end
