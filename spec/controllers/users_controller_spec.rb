require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user1) {FactoryGirl.create(:user)}
  let(:user2) {FactoryGirl.create(:user)}

  describe 'POST follow' do
    describe 'already following user' do
      before do
        sign_in user2
        user2.following_relationships.create(followed_id: user1.id)
        post :follow, id: user1.id
      end
      it 'does do something' do
        expect(flash[:danger]).not_to be nil
      end
      it 'does do something' do
        expect(response).to redirect_to user1
      end
    end
  end
end
