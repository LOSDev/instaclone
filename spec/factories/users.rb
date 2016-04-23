FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}
    password "password"
    username {Faker::Internet.user_name(nil, %w(_))}
    bio {Faker::Hipster.sentence(4)}
    avatar { File.new("#{Rails.root}/app/assets/images/sample.jpg") }
    confirmed_at 7.days.ago
  end

end
