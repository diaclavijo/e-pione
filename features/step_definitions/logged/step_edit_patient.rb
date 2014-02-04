Given(/^Physician is logged and on Editar paciente site$/) do
  login_with_user
  visit(edit_patient_path(1))
  save_and_open_page('prueba.html')
  check_navbar
  check_breadcrumb ("Editar paciente")
  #check_back_link, no lo implementamos aquí, por la cara.
end


Then(/^a "([^"]*)" is successfully updated$/) do |arg|
  update_success
end

When(/^physician only check updated values$/) do
  true
end
Then(/^Nothing is updated, and we come back to "([^"]*)" site.$/) do |arg|
  update_success
end


def update_success
  page.should have_css('.alert-success')
  page.should have_css('.alert-dismissable')
  page.should have_css('.col-md-6')
  page.should have_css('.col-md-offset-3')
  page.should have_css('.lead')
  page.should have_css('.text-center')
  page.should have_content("Paciente actualizado con éxito")#Lo que pasa ahora es que sale lo de paciente actualizado con éxito, se haya tocado algo o no.
  current_path.should == patients_path #No furula aquí, no sé por qué
end
