class AddExtractorFieldsToTarget < ActiveRecord::Migration
  def change
    add_column :targets, :lead_source, :text
    add_column :targets, :industry, :text
    add_column :targets, :city, :text
    add_column :targets, :state, :text
    add_column :targets, :country, :text, :default => 'India'
    add_column :targets, :assigned_to, :text , :default => 'admin'
  end
end
