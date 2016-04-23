When(/^I visit a post$/) do
  @user = FactoryGirl.create(:user)
  @post = FactoryGirl.create(:post, user: @user, description: "one #two three")
  visit user_path(@user)
  find(".posts img").click
end

When(/^I click on a hashtag$/) do
  click_link "#two"
end

Then(/^I should see all posts with the hashtag$/) do
  expect(page).to have_content("#two")
  expect(page).to have_selector(".posts img")
end

When(/^there are (\d+) posts with a hashtag$/) do |arg1|
  @user = FactoryGirl.create(:user)
  hashtag = "#cat"
  arg1.to_i.times do
    FactoryGirl.create(:post, user: @user, description: hashtag)
  end
  visit post_path(Post.last)
  click_link hashtag
end
