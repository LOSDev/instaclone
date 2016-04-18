class FollowingRelationship < ActiveRecord::Base
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower_id, presence: true

  validates :followed_id, presence: true
  before_save :already_following, :following_yourself

  protected

  def following_yourself
    return false if self.followed_id == self.follower_id
    true
  end

  def already_following
    !FollowingRelationship.find_by(follower_id: self.follower_id, followed_id: self.followed_id)
  end
end
