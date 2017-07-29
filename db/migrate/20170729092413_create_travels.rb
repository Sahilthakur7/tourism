class CreateTravels < ActiveRecord::Migration
  def change
    create_table :travels do |t|

      t.timestamps null: false
    end
  end
end
