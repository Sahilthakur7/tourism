class AddContentToTravel < ActiveRecord::Migration
  def change
    add_column :travels, :content, :text
  end
end
