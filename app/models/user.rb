class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

    has_attached_file :avatar, styles: {medium: "300x300", thumbnail: "100x100>"}

    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

    has_one :info
    has_many :photos
    has_many :comments,dependent: :destroy
    has_many :travels
    has_many :friendships
    ratyrate_rater

    def self.search(search)
        where("name LIKE ? or name LIKE ?", "%#{search}%", "%#{search}%")
    end


end
