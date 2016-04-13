class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :post_id, presence: true, uniqueness: {scope: :user_id}
  validates :user_id, presence: true


end
