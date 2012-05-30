class AddAddressToItem < ActiveRecord::Migration
  def change
    add_column :items, :address, :text
  end
end
