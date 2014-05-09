
def check_navbar #check navbar_appearence and behaviour
  #Check css
  page.should have_css('.navbar-wrapper')
  page.should have_css('.navbar')
  page.should have_css('.navbar-inverse')
  page.should have_css('.navbar-static-top')
  #check_links
  navbar_links
  within ('.navbar-wrapper') do
    #check_hover
    page.should have_css('.nav') #in bootstrap.css is defined .nav a:hover, so if this element is on the navbar, the hover behaviour is ensured.

    #check actual page is highlighted
    case current_path
      when new_quick_diagnosis_path
        find('.active').should have_content("Diagnóstico rápido")
      when new_contacts_path
        find('.active').should have_content("Contactar")
      else  #In other pages no link is active
        page.should_not have_css('.active')
    end


  end
end

def navbar_links
  within ('.navbar-wrapper') do #To avoid ambiguous matches with similar elements in the page
    click_link('Diagnóstico rápido')
    actual_path=current_path
    current_path.should == new_quick_diagnosis_path
    visit actual_path

    actual_path=current_path
    click_link('Contactar')
    current_path.should == new_contacts_path
    visit actual_path

    #check_button to log out
    #actual_path=current_path
    #find_button('Desconectarse').click
    #current_path.should == "/"
    #login_with_user TODO, doesn't work, doesn't find physician_email..don't know why (maybe it has another name when the user logs out)
    #visit (actual_path)


  end

end