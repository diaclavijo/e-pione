class HomeController < ApplicationController

  layout "not_logged_in"
  def index

  end

  def testing
    render 'physicians/mailer/reset_password_instructions'
  end

  def quick_diagnosis

  end
end
