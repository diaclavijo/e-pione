class HumanDiagnosesController < ConsultationResourcesController


  def new

  end

  PYTHON_SCRIPT = 'deployment_ejemplo.py'
  # GET /diagnoses
  # GET /diagnoses.json
  def create
    # python3.3 example.py age:70.3 faq:10 educ:16 ldeltotal:2
    debugger
    %x(python deployment_ejemplo.py age:70.3 faq:10 educ:16 ldeltotal:2)
    @human_diagnosis = @consultation.diagnosises.build computer_diagnosis_params

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
      params.require(:computer_diagnosis).permit(:computer_diagnosis, :probability)
    end

end
