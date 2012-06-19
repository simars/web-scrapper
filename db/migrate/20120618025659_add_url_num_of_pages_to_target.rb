class AddUrlNumOfPagesToTarget < ActiveRecord::Migration
  def change
    add_column :targets, :url, :string
    add_column :targets, :num_of_pages, :integer
  end
end
