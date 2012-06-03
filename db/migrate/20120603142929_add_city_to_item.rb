class AddCityToItem < ActiveRecord::Migration
  def change
    add_column :items, :city, :string
  end
end
