class AddAssignedToToItem < ActiveRecord::Migration
  def change
    add_column :items, :assigned_to, :string, :default => 'admin'
  end
end
