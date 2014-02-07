

class HistoryController < ApplicationController

  def index
    @patient = current_physician.patients.find(params[:patient_id])
  end

end
