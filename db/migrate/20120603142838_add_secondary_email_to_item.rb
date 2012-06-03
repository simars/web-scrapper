class AddSecondaryEmailToItem < ActiveRecord::Migration
  def change
    add_column :items, :secondary_email, :string
  end
end
