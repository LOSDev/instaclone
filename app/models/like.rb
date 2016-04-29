class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :post_id, presence: true, uniqueness: {scope: :user_id}
  validates :user_id, presence: true
  before_save :self_liking

  protected

  def self_liking
    post = Post.find(self.post_id)
    return false if post.user_id == self.user_id
    true
  end

end
