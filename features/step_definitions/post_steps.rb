When(/^I create a post$/) do
  @post = FactoryGirl.build(:post)
  click_link "New Post"
  Capybara.ignore_hidden_elements = false
  attach_file "post_image", "app/assets/images/sample.jpg"
  Capybara.ignore_hidden_elements = true
  fill_in "Description", with: @post.description
  click_button "Create Post"
end

Then(/^I should be redirected to the new post$/) do
  expect(page).to have_content @post.description
  expect(page).to have_selector(".col-md-8 img")
end

When(/^I create a post without an image$/) do
  @post = FactoryGirl.build(:post)
  click_link "New Post"
  fill_in "Description", with: @post.description
  click_button "Create Post"
end

Then(/^I should see a flash message with an error$/) do
  expect(page).to have_selector(".alert-danger")
end

When(/^I delete my post$/) do
  @post = FactoryGirl.create(:post, user: @user)
  visit post_path(@post)
  click_link "Delete"
end

Then(/^I should have (\d+) posts$/) do |arg1|
  expect(page).not_to have_selector(".posts img")
end

When(/^I visit a user$/) do
  @user = FactoryGirl.create(:user)
  @post = FactoryGirl.create(:post, user: @user)
  visit user_path(@user)
end

When(/^I click on one of his posts$/) do
  find(".posts img").click
end

Then(/^I should see the post in a modal$/) do
  expect(page).to have_selector(".modal img")
end

When(/^A User created (\d+) posts$/) do |arg1|
  @user = FactoryGirl.create(:user)
  arg1.to_i.times do
    FactoryGirl.create(:post, user: @user)
  end
  visit user_path(@user)
end

Then(/^I should see (\d+) posts$/) do |arg1|
  expect(page).to have_selector(".posts img", count: arg1)
end

When(/^I click "([^"]*)"$/) do |arg1|
  click_link arg1
end
