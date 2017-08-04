class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :hotspot
  has_attached_file :pic, styles: {medium: "300x300", thumbnail: "100x100>", full: "500x500"}
  validates_attachment_content_type :pic, :content_type => /\Aimage\/.*\Z/

  has_many :comments,dependent: :destroy
  default_scope -> {order(created_at: :desc)}

  def set_user(user)
      self.user = user
  end

  def set_hotspot(hotspot, user)
      self.hotspot = hotspot
      self.user = user
  end
end
