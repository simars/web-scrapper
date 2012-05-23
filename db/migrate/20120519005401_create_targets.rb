class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.string :name
      t.text :location
      t.text :script
      t.text :description

      t.timestamps
    end
  end
end
