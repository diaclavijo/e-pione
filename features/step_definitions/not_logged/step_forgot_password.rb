#TODO: Maybe the first step should log out the user first (if is logged)
Given(/^user is on login page$/) do
  visit "/"
end
When(/^user clicks on "([^"]*)" link$/) do |arg|
  click_link(arg)
end
Then(/^he should visit a website with help to recover credentials$/) do
  current_path.should == new_physician_password_path
  #We don't test more about this page since is not fully implemented
end
