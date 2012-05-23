class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :name
      t.text :contact
      t.text :description
      t.text :detail
      t.text :source
      t.text :link
      t.integer :container_id
      t.string :container_type

      t.timestamps
    end
  end
end
