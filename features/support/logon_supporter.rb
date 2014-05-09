#V1 sin warden..
def login_with_user
  visit "/"
  fill_in 'physician_email', :with => 'prueba@prueba.com'
  fill_in 'physician_password', :with => 'cocodrilo'
  click_button 'Acceder'
end

#v2 con warden
#def login_with_user
#    @current_user=Physician.create(email: 'test@test.com', password: 'test', password_confirmation: 'test', name: 'test_physician_name', surname: 'test_physician_surname')
#    login_as(@current_user, :run_callbacks=> false)
#end

