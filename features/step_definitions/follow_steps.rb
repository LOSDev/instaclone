When(/^I follow another user$/) do
  @another_user = FactoryGirl.create(:user)
  visit user_path(@another_user)
  click_link "Follow"
end

Then(/^I am following (\d+) user$/) do |arg1|
  visit user_path(@user)
  expect(page).to have_content("1 following")
end

Then(/^another user has (\d+) follower$/) do |arg1|
  expect(page).to have_content("1 follower")
end

When(/^I unfollow him$/) do
  click_link "Unfollow"
end

Then(/^another user has (\d+) followers$/) do |arg1|
  expect(page).to have_content("0 followers")
end

Then(/^I am following (\d+) users$/) do |arg1|
  visit user_path(@user)
  expect(page).to have_content("0 following")
end

When(/^I follow a user$/) do
  @another_user = FactoryGirl.create(:user)
  visit user_path(@another_user)
  click_link "Follow"
end

When(/^I look at the users I follow$/) do
  click_link "My Profile"
  click_link "1 following"
end

Then(/^I should see the user's bio$/) do
  expect(page).to have_content(@another_user.bio)
end

When(/^another user follows me$/) do
  @another_user = FactoryGirl.create(:user)
  @another_user.following_relationships.create(followed_id: @user.id)
  visit user_path(@user)
end

When(/^I look at my followers$/) do
  click_link "My Profile"
  click_link "1 follower"
end

When(/^(\d+) users follow me$/) do |arg1|
  arg1.to_i.times do
    FollowingRelationship.create(follower_id: FactoryGirl.create(:user).id, followed_id: @user.id)
  end
  visit user_path(@user)
  click_link "#{arg1} followers"
end

Then(/^I should see (\d+) followers$/) do |arg1|
  expect(page).to have_selector(".users img", count: arg1)
end

When(/^I follow (\d+) users$/) do |arg1|
  arg1.to_i.times do
    FollowingRelationship.create(followed_id: FactoryGirl.create(:user).id, follower_id: @user.id)
  end
  visit user_path(@user)
  click_link "#{arg1} following"
end

Then(/^I should see (\d+) followed users$/) do |arg1|
  expect(page).to have_selector(".users img", count: arg1)
end
