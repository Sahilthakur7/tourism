class Hotspot < ActiveRecord::Base
    has_many :photos
    ratyrate_rateable "stars"
    validates :name, uniqueness: :true

    def self.search(search)
        where("name LIKE ? or name LIKE ?", "%#{search}%", "%#{search}%")
    end

end
