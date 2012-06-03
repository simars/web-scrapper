class AddLeadSSourceToItem < ActiveRecord::Migration
  def change
    add_column :items, :lead_source, :string
  end
end
