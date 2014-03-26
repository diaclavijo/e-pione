class HumanDiagnosesController < ConsultationResourcesController


  def new
		@test_reloj = @consultation.test_relojs.last
		@computer_diagnosis = @consultation.computer_diagnoses.last
    @human_diagnosis = @consultation.human_diagnoses.build
  end

  # GET /diagnoses
  # GET /diagnoses.json
  def create
		@test_reloj = @consultation.test_relojs.last
    @computer_diagnosis = @consultation.computer_diagnoses.last
    @human_diagnosis = @consultation.human_diagnoses.build human_diagnosis_params
		@human_diagnosis.physician = current_physician
    respond_to do |format|
      if @human_diagnosis.save
        format.html { redirect_to [@consultation.patient, @consultation], notice: t('errors.human_diagnosis.notice.created') }
      else
        flash.now[:alert] = t('errors.human_diagnosis.alert.need-field')
        format.html { render action: 'new'}

      end
    end
  end

  private
    def human_diagnosis_params
      params.require(:human_diagnosis).permit(:diagnosis)
    end

end
