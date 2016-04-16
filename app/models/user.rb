class User < ActiveRecord::Base

  extend FriendlyId
  friendly_id :username, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, length: {minimum: 2, maximum: 40}, uniqueness: true
  validates :bio, length: {maximum: 200}
  has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_with AttachmentPresenceValidator, attributes: :avatar
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 3.megabytes

  has_many :posts
  has_many :comments
  has_many :likes
  has_many :following_relationships, foreign_key: :follower_id
  has_many :followers, through: :followed_relationships
  has_many :followed_relationships, foreign_key: :followed_id, class_name: "FollowingRelationship"
  has_many :followed_users, through: :following_relationships, source: :followed

  def likes?(post)
    !!Like.find_by(post: post, user: self)
  end

  def follows?(user)
    return true if self.following_relationships.find_by_followed_id(user.id)
    false
  end

  def feed
    followed_user_ids = "SELECT followed_id FROM following_relationships WHERE follower_id = ?"
    Post.where("user_id IN (#{followed_user_ids})", self.id).order("created_at DESC")
  end


end
