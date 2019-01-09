#Scenario 1 log in
Given(/^I am on the homepage$/) do
  visit root_path
end
When(/^I click on log in$/) do
  click_link('login')
end
Then(/^I should see the log in page$/) do
  expect(page).to have_current_path(login_path)
end

#Scenario 2 sign up
Given(/^I am on the root_path$/) do
  visit root_path
end
When(/^I click on sign up$/) do
  click_link('signup')
end
Then(/^I should see the sign up page$/) do
  expect(page).to have_current_path(signup_path)
end

#Scenario 3 Community

Given(/^I am on homepage location$/) do
  visit root_path
end
When(/^I click on community$/) do
  click_link('posts')
end
Then(/^I should see the community page$/) do
  expect(page).to have_current_path(posts_path)
end

#Scenario 4 FAQ
Given(/^homepage$/) do
  visit root_path
end
When(/^I click on FAQ$/) do
  click_link('FAQ')
end
Then(/^I should see the FAQ page$/) do
  expect(page).to have_current_path('/faq')
end

#Scenario 5 The Team
Given(/^root$/) do
  visit root_path
end
When(/^I click on The Team$/) do
  click_link('The Team')
end
Then(/^I should see the team page$/) do
  expect(page).to have_current_path('/about-team')
end

#Scenario 6 Supplemental Income
Given(/^home$/) do
  visit root_path
end
When(/^I click on Supplemental Income$/) do
  click_link('Supplemental Income')
end
Then(/^I should see the Supplemental Income page$/) do
  expect(page).to have_current_path('/supincome')
end

#Scenario 7 Reviews
Given(/^home page$/) do
  visit root_path
end
When(/^I click on Our Reviews$/) do
  click_link('Our Reviews')
end
Then(/^I should see reviews page$/) do
  expect(page).to have_current_path(reviews_path)
end

#Scenario 8 Search
Given(/^on homepage$/) do
  visit root_path
end
When(/^I click search$/) do
  click_button('Search Community!')
end
Then(/^I should see search page$/) do
  expect(page).to have_current_path('/search', ignore_query: true)
end

