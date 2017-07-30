class AddTravelToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :travel, index: true
    add_foreign_key :comments, :travels
  end
end
