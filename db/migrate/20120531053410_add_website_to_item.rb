class AddWebsiteToItem < ActiveRecord::Migration
  def change
    add_column :items, :website, :text
  end
end
