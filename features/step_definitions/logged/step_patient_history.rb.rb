Given(/^Physician is logged and on Historia Clínica del Paciente site$/) do
  login_with_user
  visit (patient_consultations_path(1))
  check_navbar
  check_breadcrumb('Pepe Paletoide') #Aquí sale el nombre del paciente, en nuestro test mierder poco resistente a cambios es pepe paletoide
  #check_back_link Tyranicus Davidus erases the back link from now on. Lazinus Yarilus doesn't give a shit.
end
Then(/^he will see a panel with the last "([^"]*)" consultations of the patient$/) do |arg|
$consultation_number=arg
end
When(/^every row will have "([^"]*)","([^"]*)","([^"]*)","([^"]*)","([^"]*)" and "([^"]*)"$/) do |arg1, arg2, arg3, arg4, arg5, arg6|
  panel_content=[arg1,arg2,arg3,arg4,arg4,arg5,arg6]
  name_panel="#jumbotron-consultations"
  links=[['Ver historia consulta', patient_consultation_path(1,1)]]
  check_panel_generic(name_panel,panel_content,$consultation_number,links)
end


Then(/^He will see a panel with three links: "([^"]*)", "([^"]*)", "([^"]*)"$/) do |arg1, arg2, arg3|
  page.should have_link(arg1)
  page.should have_link(arg2)
  page.should have_link(arg3)
end


When(/^if he clicks "([^"]*)" he will visit a page to create a new consulta$/) do |arg|
  click_link(arg)
  current_path.should == new_patient_consultation_path(1)
  visit page.driver.request.env['HTTP_REFERER']
end
When(/^if he clicks "([^"]*)" he will visit a page with the full history of the patient$/) do |arg|
  #TODO implementation
  #click_link(arg)
  #current_path.should ==
  #visit page.driver.request.env['HTTP_REFERER']
  true
end
When(/^if he clicks "([^"]*)" he will go to a page with every kind of history$/) do |arg|
  #TODO implementation
  #click_link(arg)
  #current_path.should == site
  #visit page.driver.request.env['HTTP_REFERER']
  true
end