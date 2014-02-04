def check_error_field(fields)
  #errors= all ('.field_with_errors')
  fields.each do |field|
    # fill_in field, :with => value  #It will fail if the field is not present
    page.should have_css('.field_with_errors') #TODO hacerlo de forma que chequee field por field y no todos en general.
  end

end