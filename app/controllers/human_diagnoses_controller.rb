class HumanDiagnosesController < ConsultationResourcesController


  def new
    @human_diagnosis = @consultation.human_diagnoses.build
    @computer_diagnosis = @consultation.computer_diagnoses.last
  end

  # GET /diagnoses
  # GET /diagnoses.json
  def create
    @human_diagnosis = @consultation.human_diagnoses.build human_diagnosis_params

    respond_to do |format|
      if @human_diagnosis.save
        format.html { redirect_to [@consultation.patient, @consultation], notice: t('human_diagnosis.notice.created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private
    def human_diagnosis_params
      params.require(:human_diagnosis).permit(:diagnosis)
    end

end
