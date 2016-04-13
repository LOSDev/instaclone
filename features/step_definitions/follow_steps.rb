When(/^I follow another user$/) do
  @another_user = FactoryGirl.create(:user)
  visit user_path(@another_user)
  click_button "Follow"
end

Then(/^I am following (\d+) user$/) do |arg1|
  visit user_path(@user)
  expect(page).to have_content("1 following")
end

Then(/^another user has (\d+) follower$/) do |arg1|
  expect(page).to have_content("1 follower")
end
