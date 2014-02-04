Given(/^Physician is logged on welcome site\.$/) do
  login_with_user     #TODO: ponerle un parámetro a la función y al step para poder testear con varios usuarios --> Se puede cambiar en warden
  visit(root_path)
  check_navbar #if physician is logged, navbar must be present
end

Then(/^physician should see a greeting message\.$/) do
  page.should have_content('Buenos días,')
end

Then(/^physician should see his name prefixed by Dr\.$/) do
 page.should have_content('Dr.')
 #@current_user = Physician.find_by_login("carmen@carmen.com") #TODO Probar con esto para intentar acceder a las variables del usuario y demás !!!!!!!!!

  #current_physician.name
 # page.should have_content(@current_user.name) #No funciona sin warden. TODO
end

Then(/^Physician should be able to see a link to Request Diagnosis$/) do
  page.should have_link('Solicitar Diagnóstico')
  #current_path.should == diagnostic_path  #Not implemented yet
  #visit page.driver.request.env['HTTP_REFERER']

end

Then(/^a link to Search Patient$/) do
  find('#container-welcome').click_link('Búsqueda de pacientes')
  current_path.should == patients_path
  visit page.driver.request.env['HTTP_REFERER']
end

Then(/^a link to Register New Patient$/) do
  find('#container-welcome').click_link('Registrar nuevo paciente')
  current_path.should == new_patient_path
  visit page.driver.request.env['HTTP_REFERER']
end

Then(/^he will se the links centered horizontally and vertically on the site$/) do
  page.should have_css('#container-welcome') #container-welcome is formed by a container and a row +3 col, therefore centring all the elements in the site (ASSUMING there is nothing else in the page)
end
