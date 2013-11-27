def check_back_link
  page.should have_link("<<Volver")
  #actual_path=current_path
  #current_path.should == page.driver.request.env['HTTP_REFERER'] #Tal y como está hecho ahora siempre será../ (ya que nos acabamos de loguear
  #visit(actual_path)
end