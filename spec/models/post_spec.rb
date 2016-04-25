require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:post1) { FactoryGirl.create(:post, user: user) }
  let(:post2) { FactoryGirl.create(:post, user: user) }

  it { should have_attached_file(:image) }
  it { should validate_attachment_presence(:image) }
  it { should validate_attachment_content_type(:image).
                allowing('image/png', 'image/gif').
                rejecting('text/plain', 'text/xml') }
  it { should validate_attachment_size(:image).
                less_than(4.megabytes) }

  it { should validate_presence_of(:user_id)}
  it { should validate_length_of(:description).is_at_most 120}
  it { should have_many(:comments)}
  it { should have_many(:likes)}

  it { should validate_inclusion_of(:image_filter).in_array(Post::IMAGE_FILTERS)}
  describe 'next/previous' do
    before do
      @user = FactoryGirl.create(:user)
      @post1 = FactoryGirl.create(:post, user: @user)
      @post2 = FactoryGirl.create(:post, user: @user)
    end
    describe '#next' do
      it 'returns post 2' do
        expect(@post1.next).to eq @post2
      end
      it 'returns nil' do
        expect(@post2.next).to eq nil
      end
    end
    describe '#previous' do
      it 'returns post 1' do
        expect(@post2.previous).to eq @post1
      end
      it 'returns nil' do
        expect(@post1.previous).to eq nil
      end
    end
  end

end
