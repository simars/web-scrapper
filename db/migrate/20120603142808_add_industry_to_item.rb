class AddIndustryToItem < ActiveRecord::Migration
  def change
    add_column :items, :industry, :string
  end
end
