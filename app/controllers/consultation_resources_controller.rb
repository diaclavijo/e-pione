# This class is the superclass of all resources songs of consultation. It implement the method which loads the consultation for all the actions.

class ConsultationResourcesController < ApplicationControllerSigned
  layout  "consultation_resources"
  before_action :set_consultation, only: [:show, :create, :new, :update, :edit, :destroy, :index, :correct]


  private

    def set_consultation
      @consultation = current_physician.consultations.find(params[:consultation_id])
    end
end
