class Comment < ActiveRecord::Base
  belongs_to :post, counter_cache: true
  belongs_to :user

  validates :post, presence: true
  validates :user, presence: true
  validates :content, length: {minimum: 1, maximum: 100}
  self.per_page = 12
end
