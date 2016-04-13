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
