class RemoveAddres2FromAddresses < ActiveRecord::Migration
  def change
    remove_column :addresses, :addres_2, :string
  end
end
