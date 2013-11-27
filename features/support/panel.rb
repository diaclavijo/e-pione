def check_panel(arg)
    #Check that there is a table patients inside a jumbotron, forming a panel
    #check that the tabla has the essential headers to show the data of the patients
    within ('#jumbotron-patients') do
      page.should  have_css('.table-responsive')
      page.should  have_content('Apellidos')
      page.should  have_content('Nombre')
      page.should  have_content('NHC')
      page.should  have_content('NIF')
      page.should  have_content('F.NAC')
      page.should  have_content('Exitus')


      first(:link, 'Más datos').click
      current_path.should == edit_patient_path(1)
      visit page.driver.request.env['HTTP_REFERER']

      first(:link, 'Historia clínica').click
      current_path.should == patient_consultations_path(1)
      visit page.driver.request.env['HTTP_REFERER']

      #TODO Since above we only click in the first link..
      #mas_datos_links=all(:link, 'Más datos')
      #historia_clinica_links=all(:link, 'Historia clínica')
      #historia_clinica_links.each_with_index do |link,index|
      #    link.visible?(index)
      #end
      #current_path.should == edit_patient_path(1) #.
      #visit page.driver.request.env['HTTP_REFERER']

      arg=arg.to_i
      #check that there are maximum 10 rows (=10 patients) on the table (can be less if there are less patients)
      page.all('#table-patients tr').count.should <= arg

    end


end



