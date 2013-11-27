Given(/^Physician is logged and on Registrar Nuevo Paciente site$/) do
  login_with_user
  visit (new_patient_path)
  check_navbar
  check_back_link
end
When(/^I fill in the following:$/) do |table|
  # table is a | Apellido (*)           |  <surname>   |
  data= table.raw
  fill_fields(data)
end

When(/^when I select the born date of the patient in the following:$/) do |table|
  # table is a |patient_birth_2i         |  <month>        |
  data= table.raw
  select_dropdowns(data)
end

When(/^when I select in the following:$/) do |table|
  # table is a | Estado civil (*) |  <civil_state>  |
  data= table.raw
  select_dropdowns(data)
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

