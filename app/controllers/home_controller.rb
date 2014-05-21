class HomeController < ApplicationController

  layout "not_logged_in"
  def index
    @contact_form = ContactForm.new(params[:contact_form])
  end

  def testing
    render 'physicians/mailer/reset_password_instructions'
  end

  def quick_diagnosis

  end

  def info

  end

  def privacy

  end

end
