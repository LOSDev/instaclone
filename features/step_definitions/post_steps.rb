When(/^I create a post$/) do
  @post = FactoryGirl.build(:post)
  click_link "New Post"
  attach_file "Image", "app/assets/images/sample.jpg"
  fill_in "Description", with: @post.description
  click_button "Create Post"
end

Then(/^I should be redirected to the new post$/) do
  expect(page).to have_content @post.description
  expect(page).to have_selector(".col-md-8 img")
end
