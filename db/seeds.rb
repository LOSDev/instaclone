# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
NUMBER_OF_USERS = 30
NUMBER_OF_IMAGES = 26

puts "Creating Users..."

NUMBER_OF_USERS.times do
  FactoryGirl.create(:user, password: Faker::Internet.password, avatar: File.new("#{Rails.root}/app/assets/images/image_#{rand 1..NUMBER_OF_IMAGES}.jpeg"))
end

puts "Creating Posts..."
(24 * NUMBER_OF_USERS).times do |n|
  FactoryGirl.create(:post, user_id: (rand 1..User.count), image_filter: Post::IMAGE_FILTERS[rand 0..Post::IMAGE_FILTERS.length - 1], image: File.new("#{Rails.root}/app/assets/images/image_#{rand 1..NUMBER_OF_IMAGES}.jpeg"))
end

puts "Creating Comments..."
(50 * NUMBER_OF_USERS).times do
  FactoryGirl.create(:comment, user_id: (rand 1..User.count), post_id: (rand 1..Post.count))
end

puts "Creating Likes..."
(40 * NUMBER_OF_USERS).times do
  Like.create(user_id: (rand 1..User.count), post_id: (rand 1..Post.count))
end

puts "Creating Following Relationships..."
(20 * NUMBER_OF_USERS).times do
  FollowingRelationship.create(follower_id: (rand 1..User.count), followed_id: (rand 1..User.count))
end

puts "Done"
