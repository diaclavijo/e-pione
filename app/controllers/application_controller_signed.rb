class ApplicationControllerSigned < ApplicationController
  before_filter :authenticate_physician!


end
