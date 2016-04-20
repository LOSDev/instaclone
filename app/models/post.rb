class Post < ActiveRecord::Base
  belongs_to :user
  IMAGE_FILTERS = ["no_filter", "aden", "_1977", "lofi", "brooklyn", "nashville", "inkwell", "toaster", "xpro2"]
  has_attached_file :image, styles: { medium: "800x800>", thumb: "350x350#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates_with AttachmentPresenceValidator, attributes: :image
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 4.megabytes

  validates :user_id, presence: true
  validates :description, length: {maximum: 120}
  validates_inclusion_of :image_filter, in: IMAGE_FILTERS
  has_many :comments
  has_many :likes

end
