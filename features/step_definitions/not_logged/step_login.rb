When(/^physician sign in correctly$/) do
     login_with_user
end

Then(/^he should visit "([^"]*)" page$/) do |arg|
  #current_path.should == root_path cambiar pa que esto sea automático taaal
  page.should have_content(arg)
end

When(/^physician sign in incorrectly$/) do
  visit "/"
  fill_in 'physician_email', :with => 'cdsarmen@carmen.com'
  fill_in 'physician_password', :with => 'alzheimer'
  click_button 'Acceder'
end

Then(/^he should see a warning "(.*?)" message$/) do |error_message|
  current_path.should == physician_session_path
  page.should have_css('.alert')
  page.should have_css('.alert-warning')
  page.should have_css('.alert-dismissable')
  page.should have_css('.col-md-6')
  page.should have_css('.col-md-offset-3')
  page.should have_css('.lead')
  page.should have_css('.text-center')
  page.should have_content(error_message)
end


