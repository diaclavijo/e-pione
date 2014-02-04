def check_panel_generic(name_panel,panel_content,row_number,links_panel)
  #Check that there is a table patients inside a jumbotron, forming a panel
  #check that the tabla has the essential headers to show the data of the patients
  within (name_panel) do
    page.should  have_css('.table-responsive')

    panel_content.each do |content|
      page.should have_content(content)
    end

    row_number=row_number.to_i
    #check that there are maximum 5 rows (=5 patients) on the table (can be less if there are less consultations)
    page.all('tr').count.should <= row_number+1 #+1 ya que se cuenta los tr de la cabecera

    links_panel.each do |link,site|
      page.should have_content(link)
      first(:link, link).click
      current_path.should == site
      visit page.driver.request.env['HTTP_REFERER']
    end
  end
end


