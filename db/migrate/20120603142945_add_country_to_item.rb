class AddCountryToItem < ActiveRecord::Migration
  def change
    add_column :items, :country, :string
  end
end
