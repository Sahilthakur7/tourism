class Hotspot < ActiveRecord::Base
    has_many :photos

    def self.search(search)
        where("name LIKE ? or name LIKE ?", "%#{search}%", "%#{search}%")
    end

end
