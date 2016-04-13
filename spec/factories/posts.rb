FactoryGirl.define do
  factory :post do
    description "This is my awesome picture"
    user
    image { File.new("#{Rails.root}/app/assets/images/sample.jpg") } 

  end

end
