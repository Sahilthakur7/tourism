class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :user, index: true
      t.text :caption

      t.timestamps null: false
    end
    add_foreign_key :photos, :users
  end
end
