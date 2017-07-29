class Travel < ActiveRecord::Base
    belongs_to :user
  has_attached_file :featured_image, styles: {medium: "600x600", thumbnail: "200x200>", full: "500x500"}
  validates_attachment_content_type :featured_image, :content_type => /\Aimage\/.*\Z/

  def set_user(user)
      self.user = user
  end
end
