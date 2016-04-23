FactoryGirl.define do
  factory :post do
    description
    user
    image { File.new("#{Rails.root}/app/assets/images/sample.jpg") }

  end
  sequence :description do |n|
    "description_#{n}"
  end

end
