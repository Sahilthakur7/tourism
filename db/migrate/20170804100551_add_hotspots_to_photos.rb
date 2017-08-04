class AddHotspotsToPhotos < ActiveRecord::Migration
  def change
    add_reference :photos, :hotspot, index: true
    add_foreign_key :photos, :hotspots
  end
end
