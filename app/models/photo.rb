class Photo < ActiveRecord::Base
  belongs_to :user
  has_attached_file :pic, styles: {medium: "300x300", thumbnail: "100x100>", full: "500x500"}
  validates_attachment_content_type :pic, :content_type => /\Aimage\/.*\Z/

  has_many :comments,dependent: :destroy

  def set_user(user)
      self.user = user
  end
end
