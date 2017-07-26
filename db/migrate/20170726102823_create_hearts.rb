class CreateHearts < ActiveRecord::Migration
  def change
    create_table :hearts do |t|
        t.belongs_to :photo , index: true
        t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
