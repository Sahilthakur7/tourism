class AddAddressToHotspots < ActiveRecord::Migration
  def change
    add_column :hotspots, :address, :string
  end
end
