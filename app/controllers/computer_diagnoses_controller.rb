class ComputerDiagnosisesController < ConsultationResourcesController


  # GET /diagnoses
  # GET /diagnoses.json
  def create
    @computer_diagnosis = @consultation.diagnosises.build computer_diagnosis_params

    respond_to do |format|
      if @computer_diagnosis.save
        #format.html { redirect_to [@patient,@consultation], notice: 'Consulta creada con éxito' }
        #format.json { render action: 'show', status: :created, location: @consultation }
      else
        #format.html { render action: 'new' }
        #format.json { render json: @consultation.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def computer_diagnosis_params
      params.require(:computer_diagnosis).permit(:diagnosis, :probability)
    end

end
