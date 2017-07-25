class Photo < ActiveRecord::Base
  belongs_to :user
  has_attached_file :pic, styles: {medium: "300x300", thumbnail: "100x100>"}
  validates_attachment_content_type :pic, :content_type => /\Aimage\/.*\Z/

  def set_user(user)
      self.user = user
  end
end
