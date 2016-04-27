When(/^I look at the feed$/) do
  @user2 = FactoryGirl.create(:user)
  13.times {FactoryGirl.create(:post, user: @user2)}
  @user.followed_users << @user2
  visit root_path
  click_link @user.username
  click_link "My Feed"
end

Then(/^I should see the posts of my friends$/) do
  expect(page).to have_selector(".posts img", count: 12)
end

Then(/^I should see more posts of my friends$/) do
  expect(page).to have_selector(".posts img", count: 13)
end

When(/^I try to look at my feed$/) do
  @user = FactoryGirl.create(:user)
  visit feed_users_path
end

Then(/^I should see the sign in page$/) do
  expect(page).to have_content("Log in")
end
