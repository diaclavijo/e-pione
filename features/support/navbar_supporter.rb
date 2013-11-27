
def check_navbar #check navbar_appearence and behaviour
  #Check css
  page.should have_css('.navbar-wrapper')
  page.should have_css('.navbar')
  page.should have_css('.navbar-inverse')
  page.should have_css('.navbar-static-top')
  #check_links
  navbar_links
  within ('.navbar-wrapper') do
    #check_dropdown
    page.should have_css('.dropdown')
    page.should have_css('.dropdown-toggle')
    page.should have_css('.dropdown-menu')
    #we do not check hr line inside because the desigg may change.

    #check_hover
    page.should have_css('.nav') #in bootstrap.css is defined .nav a:hover, so if this element is on the navbar, the hover behaviour is ensured.

    #check actual page is highlighted
    case current_path
      when root_path
        path_string="Inicio"
      when patients_path
        path_string="Búsqueda de pacientes"
      when new_patient_path
        path_string="Registrar nuevo paciente"
    end
    find('.active').should have_content(path_string)

  end
end

def navbar_links
  within ('.navbar-wrapper') do #To avoid ambiguous matches with similar elements in the page
    click_link('Inicio')
    current_path.should == root_path
    visit page.driver.request.env['HTTP_REFERER']

    click_link('Búsqueda de pacientes')
    current_path.should == patients_path
    visit page.driver.request.env['HTTP_REFERER']

    click_link('Registrar nuevo paciente')
    current_path.should == new_patient_path
    visit page.driver.request.env['HTTP_REFERER']

    #check_button to log out
    #actual_path=current_path
    #find_button('Desconectarse').click
    #current_path.should == "/"
    #login_with_user TODO, doesn't work, doesn't find physician_email..don't know why (maybe it has another name when the user logs out)
    #visit (actual_path)

    #This links are not implented yet, so we only test their visibility
    find_link('Otros').visible?
    find_link('Borrar pacientes').visible?
    find_link('Modificar mi perfil').visible?
    find_link('Soporte técnico').visible?
  end

end