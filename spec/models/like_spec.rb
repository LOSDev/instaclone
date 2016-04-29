require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) {FactoryGirl.create(:user)}
  let(:user2) {FactoryGirl.create(:user)}
  let(:post) {FactoryGirl.create(:post, user: user)}

  it {should belong_to(:post)}
  it {should belong_to(:user)}
  it {should validate_presence_of(:post_id)}
  it {should validate_presence_of(:user_id)}

  describe 'liking posts' do
    describe 'liking a post twice' do
      it 'does not save' do
        user2.likes.create(post_id: post.id)
        like = user2.likes.build(post_id: post.id)
        expect(like.save).to eq false
      end
    end
    describe 'like your own post' do
      it 'is not valid' do
        like = user.likes.build(post_id: post.id)
        expect(like.save).to eq false
      end
    end
  end
end
