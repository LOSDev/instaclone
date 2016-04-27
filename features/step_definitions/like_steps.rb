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

When(/^I watch my liked posts$/) do
  visit root_path
  click_link @user.username
  click_link "Liked Posts"
end

When(/^I like (\d+) posts$/) do |arg1|
  user = FactoryGirl.create(:user)
  arg1.to_i.times do
    post = FactoryGirl.create(:post, user: user)
    Like.create(post: post, user: @user)
  end
end
