When(/^I search for a user$/) do
  @user = FactoryGirl.create(:user)
  visit root_path
  fill_in "search_term", with: @user.username
end

Then(/^I should the username$/) do
  expect(page).to have_link @user.username, href: user_path(@user)
end
