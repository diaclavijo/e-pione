$data1
$data2
$data3

Given(/^Physician is logged and on "([^"]*)" site$/) do |arg|
  login_with_user
  visit (new_patient_path)
  check_navbar
  check_breadcrumb (arg)
  check_back_link
end
When(/^I fill in the following:$/) do |table|
  # table is a | Apellido (*)           |  <surname>   |
  $data1= table.raw
  fill_fields($data1)
end

When(/^when I select the born date of the patient in the following:$/) do |table|
  # table is a |patient_birth_2i         |  <month>        |
  $data2= table.raw
  select_dropdowns($data2)
end

When(/^when I select in the following:$/) do |table|
  # table is a | Estado civil (*) |  <civil_state>  |
  $data3= table.raw
  select_dropdowns($data3)
end

When(/^click on "([^"]*)" button$/) do |arg|
  click_button(arg)
end

Then(/^a "([^"]*)" is successfully created$/) do |arg|
  #current_path.should= patient_id_consultations --> coñazo comprobar si
  page.should have_css('.alert')
  page.should have_css('.alert-success')
  page.should have_css('.alert-dismissable')
  page.should have_css('.col-md-6')
  page.should have_css('.col-md-offset-3')
  page.should have_css('.lead')
  page.should have_css('.text-center')
  page.should have_content("Paciente creado con éxito")
end

When(/^I not fill mandatory camps$/) do
  true #No hacemos nada
end
Then(/^a warning message appears$/) do  #Probably the implementation of this will change
  page.should have_css('.alert')
  page.should have_css('.alert-warning')
  page.should have_css('.alert-dismissable')
  page.should have_css('.col-md-6')
  page.should have_css('.col-md-offset-3')
  page.should have_content("error")
end


Then(/^the fields with errors are remarked$/) do
  check_error_field($data1)
  check_error_field($data2)
  check_error_field($data3)
end
