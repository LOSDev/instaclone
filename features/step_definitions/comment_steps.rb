When(/^I create a comment$/) do
  @post = FactoryGirl.create(:post, user: @user)
  @comment = FactoryGirl.build(:comment)
  visit post_path(@post)
  fill_in "comment_content", with: @comment.content
  click_button "Submit Comment"
end

Then(/^I should see the comment$/) do
  expect(page).to have_content @comment.content
end

When(/^I delete the comment$/) do
  click_link "X"
end

Then(/^I should not see the comment$/) do
  expect(page).not_to have_content @comment.content
end

When(/^I create an invalid comment$/) do
  @post = FactoryGirl.create(:post, user: @user)
  @comment = FactoryGirl.build(:comment)
  visit post_path(@post)
  fill_in "comment_content", with: ""
  click_button "Submit Comment"
end

Then(/^I should see a flash error message$/) do
  expect(page).to have_selector(".alert-danger", text: "too short")
end
