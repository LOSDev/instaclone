FactoryGirl.define do
  factory :comment do
    content {Faker::Hipster.sentence(1)}
    post
    user
  end

end
