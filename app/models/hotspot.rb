class Hotspot < ActiveRecord::Base

    def self.search(search)
        where("name LIKE ? or name LIKE ?", "%#{search}%", "%#{search}%")
    end

end
