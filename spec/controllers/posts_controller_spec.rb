require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user1) {FactoryGirl.create(:user)}
  let(:user2) {FactoryGirl.create(:user)}

  let(:post1) {FactoryGirl.create(:post, user: user1)}
  describe 'POST like' do
    describe 'unsuccessful like' do
      before do
        sign_in user2
        user2.likes.create(post: post1)
        post :like, id: post1.id
      end
      it 'sets flash error' do
        expect(flash[:danger]).not_to be nil
      end
      it 'redirects to post' do
        expect(response).to redirect_to post1
      end
    end
  end
end
