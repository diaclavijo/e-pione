When(/^physician sign in correctly$/) do
        visit "/"
        fill_in 'physician_email', :with => 'carmen@carmen.com'
        fill_in 'physician_password', :with => 'alzheimer'
        click_button 'Acceder'
end

Then(/^he should visit welcome page$/) do
  current_path.should == root_path
  page.should have_content('Buenos días')
end

When(/^physician sign in incorrectly$/) do
  visit "/"
  fill_in 'physician_email', :with => 'cdsarmen@carmen.com'
  fill_in 'physician_password', :with => 'alzheimer'
  click_button 'Acceder'
end

Then(/^he should see a warning "(.*?)" message$/) do |arg1|
  current_path.should == physician_session_path
  page.should have_css('.alert')
  page.should have_css('.alert-warning')
  page.should have_css('.alert-dismissable')
  page.should have_css('.col-md-6')
  page.should have_css('.col-md-offset-3')
  page.should have_css('.lead')
  page.should have_css('.text-center')
  page.should have_content('Contraseña o Email incorrecto.')
end
