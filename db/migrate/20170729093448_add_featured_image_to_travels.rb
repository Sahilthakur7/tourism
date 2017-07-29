class AddFeaturedImageToTravels < ActiveRecord::Migration
    def self.up
        change_table :travels do |t|
            t.attachment :featured_image
        end
    end

    def self.down
        drop_attached_file :travels, :featured_image
    end
end
