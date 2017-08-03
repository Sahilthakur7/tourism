class CreateHotspots < ActiveRecord::Migration
  def change
    create_table :hotspots do |t|
      t.string :name
      t.integer :stars

      t.timestamps null: false
    end
  end
end
