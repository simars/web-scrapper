class AddLastNameToItem < ActiveRecord::Migration
  def change
    add_column :items, :last_name, :string
  end
end
