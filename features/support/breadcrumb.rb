
#Breadcrumb is now Inicio/Blablalb/Actual_Page
#we just checked for actual page to be active and that there are a separator ("/")
def check_breadcrumb(actual_page)
  within ('.page-header') do
    find('.breadcrumb').first('li').visible?
    find('.active').should have_content(actual_page)
  end
end