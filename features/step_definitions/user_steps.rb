When(/^I sign up for the website$/) do
  @user = FactoryGirl.build(:user)
  visit root_path
  click_link "Sign up"
  fill_in "Email", with: @user.email
  fill_in "user_password", with: @user.password
  fill_in "Password confirmation", with: @user.password
  fill_in "Username", with: @user.username
  fill_in "Bio", with: @user.bio
  attach_file "Avatar", "app/assets/images/sample.jpg"
  click_button "Sign up"

end

Then(/^I have created a user account$/) do
  expect(page).to have_content "You have signed up successfully"
  expect(page).not_to have_selector(".alert-danger")
end
