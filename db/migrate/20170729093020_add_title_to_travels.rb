class AddTitleToTravels < ActiveRecord::Migration
  def change
    add_column :travels, :title, :string
  end
end
