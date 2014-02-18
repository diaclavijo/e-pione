class ComputerDiagnosesController < ConsultationResourcesController


  def new

  end

  # GET /diagnoses
  # GET /diagnoses.json
  def create

    valid = @consultation.test_faqs.any?
    valid = @consultation.test_minimentals.any?
    def age(birthdate)
      today = Date.today

    end

    if valid
      @computer_diagnosis = @consultation.diagnosises.build
    end

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


end
