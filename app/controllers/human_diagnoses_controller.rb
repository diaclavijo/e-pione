class HumanDiagnosesController < ConsultationResourcesController


  def new
    @human_diagnosis = @consultation.human_diagnoses.build
  end

  # GET /diagnoses
  # GET /diagnoses.json
  def create

  end

  private
    def computer_diagnosis_params
      params.require(:human_diagnosis).permit(:human_diagnosis)
    end

end
