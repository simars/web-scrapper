class AddTargetTypeToTarget < ActiveRecord::Migration
  def change
    add_column :targets, :target_type, :string
  end
end
