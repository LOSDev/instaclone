When(/^I create a comment$/) do
  @post = FactoryGirl.create(:post, user: @user)
  @comment = FactoryGirl.build(:comment)
  visit post_path(@post)
  fill_in "comment_content", with: @comment.content
  click_button "Submit"
end

Then(/^I should see the comment$/) do
  expect(page).to have_content @comment.content
end

When(/^I delete the comment$/) do
  page.find(".delete-comment").click()
end

Then(/^I should not see the comment$/) do
  expect(page).not_to have_content @comment.content
end

When(/^I create an invalid comment$/) do
  @post = FactoryGirl.create(:post, user: @user)
  @comment = FactoryGirl.build(:comment)
  visit post_path(@post)
  fill_in "comment_content", with: ""
  click_button "Submit"
end

Then(/^I should see a flash error message$/) do
  expect(page).to have_selector(".alert-danger", text: "too short")
end

When(/^I see a comment from another user$/) do
  @another_user = FactoryGirl.create(:user)
  @post = FactoryGirl.create(:post, user: @another_user)
  @comment = FactoryGirl.create(:comment, user: @another_user, post: @post)
  visit post_path(@post)
end

Then(/^I should not see the delete link$/) do
  expect(page).to have_content @comment.content
  expect(page).not_to have_link("X")
end

When(/^I visit a post with (\d+) comments$/) do |arg1|
  @post = FactoryGirl.create(:post, user: @user)
  arg1.to_i.times do
    FactoryGirl.create(:comment, user: @user, post: @post)
  end
  visit post_path(@post)
end

Then(/^I should see (\d+) comments$/) do |arg1|
  expect(page).to have_selector(".comments .comment", count: arg1)
end
