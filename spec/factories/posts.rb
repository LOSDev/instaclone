FactoryGirl.define do
  factory :post do
    description
    user
    image { File.new("#{Rails.root}/app/assets/images/sample.jpg") }

  end
  sequence :description do |n|
    "#{Faker::Hipster.word} ##{Faker::Hipster.word} #{Faker::Hipster.word} ##{Faker::Hipster.word}"
  end

end
