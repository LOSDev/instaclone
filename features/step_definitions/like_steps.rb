When(/^I like a post$/) do
  @another_user = FactoryGirl.create(:user)
  @post = FactoryGirl.create(:post, user: @another_user)
  visit post_path(@post)
  click_button "Like"
end

Then(/^The post should have one like$/) do
  expect(page).to have_content("1 Like")
end

When(/^I unlike a post$/) do
  click_button "Unlike"
end

Then(/^the post should have (\d+) likes$/) do |arg1|
  expect(page).to have_content("0 Likes")
end
