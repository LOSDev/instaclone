FactoryGirl.define do
  factory :comment do
    content {Faker::Lorem.sentence(1)}
    post
    user
  end

end
