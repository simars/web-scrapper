class AddLeadNoToItem < ActiveRecord::Migration
  def change
    add_column :items, :lead_no, :string
  end
end
