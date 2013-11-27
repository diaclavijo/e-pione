Given(/^Physician is logged and on Búsqueda de Pacientes site.$/) do
  login_with_user
  visit (patients_path)
  check_navbar
  check_back_link
end



Then(/^physician should see a panel with essential data of maximum (\d+) patients that will display inside the panel$/) do |arg|
  check_panel(arg)
end

When(/^the panel will be titled by "([^"]*)"$/) do |arg|

  within('#jumbotron-patients') do
    page.should have_content(arg)

  end
end
When(/^inside the panel there will be a Buscar por button, a Buscar button along with a text field and a Nuevo Paciente button$/) do
  within('#jumbotron-patients') do
    #We check the dropdown "Buscar por" in a different way since is not a button in the code
    find('#dropdown-search-patient').should have_content('Buscar por')
    find('#dropdown-search-patient').should have_content('Nombre')
    find('#dropdown-search-patient').should have_content('Apellido')

    page.should have_button('Buscar')
    page.should have_css('#text-search-patient')
    page.should have_link('Nuevo paciente')

    click_link('Nuevo paciente')
    current_path.should == new_patient_path
    visit page.driver.request.env['HTTP_REFERER']

    #TODO Buscar button behaviour and buscar por dropdown behaviour

  end
end



When(/^if there are (\d+) patients or more registered, there will be a paginator$/) do |arg|
  pending #TODO: Se debería comprobar con la bd..ya que nunca va a haber más de 10 filas por página...
  #arg=arg.to_i
  #check that there are maximum 10 rows (=10 patients) on the table (can be less if there are less patients)
  #save_and_open_page('prueba.html')
  #if page.all('#table-patients tr').count.should <= arg
  #    page.should_not have_css('paginator')
  #end
end