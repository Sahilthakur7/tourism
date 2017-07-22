class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.text :interests
      t.string :city
      t.string :fb
      t.string :dob
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :infos, :users
  end
end
