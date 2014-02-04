Given(/^Physician is logged and on "([^"]*)" of the patient stie$/) do |arg|
  login_with_user
  visit (patient_consultation_path(1,1))
  save_and_open_page('prueba.html')
  check_navbar
  check_breadcrumb('Consulta 1') #Aquí sale el nombre del paciente, en nuestro test mierder poco resistente a cambios es pepe paletoide
                                #check_back_link Tyranicus Davidus erases the back link from now on. Lazinus Yarilus doesn't give a shit.
end

Then(/^he will see a panel with buttons to all the possible consultations\/kinds:$/) do |table|
  # table is a |Sintomatología no cognitiva|
  data=table.raw

  data.each do |consult_kind|
    page.should have_link(consult_kind[1])
  end
end