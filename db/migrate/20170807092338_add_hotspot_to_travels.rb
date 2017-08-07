class AddHotspotToTravels < ActiveRecord::Migration
  def change
    add_reference :travels, :hotspot, index: true
    add_foreign_key :travels, :hotspots
  end
end
