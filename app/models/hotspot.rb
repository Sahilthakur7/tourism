class Hotspot < ActiveRecord::Base
    has_many :photos
    ratyrate_rateable "stars"

    def self.search(search)
        where("name LIKE ? or name LIKE ?", "%#{search}%", "%#{search}%")
    end

end
