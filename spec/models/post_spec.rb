require 'rails_helper'

RSpec.describe Post, type: :model do
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


end
