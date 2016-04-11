Given(/^I am a guest$/) do
end

When(/^I visit the homepage$/) do
  visit root_path
end

Then(/^I should see the logo$/) do
  expect(page).to have_selector(".navbar-brand")
  expect(page).to have_link("Instagram", href: root_path)

end

Then(/^I should see a Sign up link$/) do
  expect(page).to have_link("Sign up")
end
