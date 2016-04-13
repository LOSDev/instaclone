require 'rails_helper'

RSpec.describe User, type: :model do
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

end
