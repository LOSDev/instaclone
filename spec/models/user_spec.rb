require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user1) {FactoryGirl.create(:user)}
  let(:user2) {FactoryGirl.create(:user)}
  let(:post) {FactoryGirl.create(:post, user: user1)}

  it { should validate_length_of(:bio).is_at_most 200}
  it { should validate_length_of(:username).is_at_most 40}
  it { should validate_length_of(:username).is_at_least 2}
  it { should validate_uniqueness_of(:username)}

  it { should have_attached_file(:avatar) }
  it { should validate_attachment_presence(:avatar) }
  it { should validate_attachment_content_type(:avatar).
                allowing('image/png', 'image/gif').
                rejecting('text/plain', 'text/xml') }
  it { should validate_attachment_size(:avatar).
                less_than(3.megabytes) }

  it { should have_many(:posts)}
  it { should have_many(:comments)}
  it { should have_many(:likes)}
  it { should have_many(:following_relationships)}
  it { should have_many(:followers)}
  it { should have_many(:followed_relationships)}



  describe '#likes?' do
    describe 'user likes post' do
      it 'returns true' do
        user2.likes.create(post: post)
        expect(user2.likes? post).to be true
      end
    end
    describe 'user does not like post' do
      it 'returns false' do
        expect(user2.likes? post).to be false
      end
    end
  end

  describe '#follows?' do
    describe 'user2 follows user1' do
      it 'returns true' do
        user2.following_relationships.create(followed_id: user1.id)
        expect(user2.follows? user1).to be true
      end
    end
    describe 'user2 does not follow user1' do
      it 'returns false' do
        expect(user2.follows? user1).to be false
      end
    end
  end

end
