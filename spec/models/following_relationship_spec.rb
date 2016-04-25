require 'rails_helper'

RSpec.describe FollowingRelationship, type: :model do
  let(:user1) {FactoryGirl.build_stubbed(:user)}
  let(:user2) {FactoryGirl.build_stubbed(:user)}


  it { should belong_to(:follower)}
  it { should belong_to(:followed)}
  it { should validate_presence_of(:follower_id)}
  it { should validate_presence_of(:followed_id)}

  describe 'following users' do
    describe 'following another user' do
      it 'save a record' do
        relationship = user1.following_relationships.build(followed_id: user2.id)
        expect(relationship.save).to be true
      end
    end
    describe 'following yourself' do
      it 'should not be valid' do
        relationship = user1.following_relationships.build(followed_id: user1.id)
        expect(relationship.save).to be false
      end
    end
    describe 'follow user twice' do
      it 'is not valid' do
        user1.following_relationships.create(followed_id: user2.id)
        relationship = user1.following_relationships.build(followed_id: user2.id)
        expect(relationship.save).to be false

      end
    end
  end

end
