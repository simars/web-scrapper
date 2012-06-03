class AddLeadStatusToItem < ActiveRecord::Migration
  def change
    add_column :items, :lead_status, :string
  end
end
