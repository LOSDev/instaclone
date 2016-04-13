class Post < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, styles: { medium: "600x600>", thumb: "250x250#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates_with AttachmentPresenceValidator, attributes: :image
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 3.megabytes

  validates :user_id, presence: true
  validates :description, length: {maximum: 80}

  has_many :comments
end
