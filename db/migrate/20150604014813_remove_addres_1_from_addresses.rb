class RemoveAddres1FromAddresses < ActiveRecord::Migration
  def change
    remove_column :addresses, :addres_1, :string
  end
end
