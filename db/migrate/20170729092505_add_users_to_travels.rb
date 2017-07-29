class AddUsersToTravels < ActiveRecord::Migration
  def change
    add_reference :travels, :user, index: true
    add_foreign_key :travels, :users
  end
end
