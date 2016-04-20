FactoryGirl.define do
  factory :post do
    description {Faker::Hipster.sentence}
    user
    image { File.new("#{Rails.root}/app/assets/images/sample.jpg") }

  end

end
