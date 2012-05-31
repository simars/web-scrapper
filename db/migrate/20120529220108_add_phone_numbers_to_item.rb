class AddPhoneNumbersToItem < ActiveRecord::Migration
  def change
    add_column :items, :phone, :text
    add_column :items, :phone_other, :text
  end
end
