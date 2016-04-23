When(/^I sign up for the website$/) do
  @user = FactoryGirl.build(:user)
  visit root_path
  click_link "Sign up"
  fill_in "Email", with: @user.email
  fill_in "user_password", with: @user.password
  fill_in "Password confirmation", with: @user.password
  fill_in "Username", with: @user.username
  fill_in "Bio", with: @user.bio
  Capybara.ignore_hidden_elements = false
  attach_file "Avatar", "app/assets/images/sample.jpg"
  Capybara.ignore_hidden_elements = true
  click_button "Sign up"
end

Then(/^I have created a user account$/) do
  expect(page).to have_content "signed up successfully"
  expect(page).not_to have_selector(".alert-danger")
end

Given(/^I am a logged in user$/) do
  @user = FactoryGirl.create(:user)

  visit root_path
  click_link "Sign in"
  fill_in "Email", with: @user.email
  fill_in "Password", with: @user.password
  click_button "Log in"
end

When(/^I change my username$/) do
  @new_user_name = Faker::Internet.user_name
  click_link "Account Settings"
  fill_in "Username", with: @new_user_name
  fill_in "Current password", with: @user.password
  click_button "Update"
end

Then(/^I should see the new username$/) do
  expect(page).to have_content @new_user_name
end

When(/^I visit my Profile$/) do
  click_link "My Profile"
end

Then(/^I should see my bio$/) do
  expect(page).to have_content @user.bio
end

When(/^I sign up for the website without a username$/) do
  @user = FactoryGirl.build(:user)
  visit root_path
  click_link "Sign up"
  fill_in "Email", with: @user.email
  fill_in "user_password", with: @user.password
  fill_in "Password confirmation", with: @user.password
  fill_in "Username", with: ""
  fill_in "Bio", with: @user.bio
  Capybara.ignore_hidden_elements = false
  attach_file "Avatar", "app/assets/images/sample.jpg"
  Capybara.ignore_hidden_elements = true
  click_button "Sign up"
end
