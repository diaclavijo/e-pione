class ComputerDiagnosesController < ConsultationResourcesController


  def new
    validate_tests
  end

  # GET /diagnoses
  # GET /diagnoses.json
  def create
    validate_tests

    if @faq_score && @minimental_score
      age = age @consultation.patient.birth
      education = @consultation.patient.education
      diagnosis, probability = baby_siad @faq_score, @minimental_score, age, education
      @computer_diagnosis = @consultation.computer_diagnoses.build diagnosis, probability
    end

    respond_to do |format|
      if @faq_score && @minimental_score && @computer_diagnosis.save
        format.html { redirect_to [@consultation, :computer_diagnoses, :new], notice: 'Diagnóstico realizado con
éxito' }
      else
        flash.now[:alert] = 'No ha realizado los tests necesarios'
        format.html { render action: 'new'}
      end
    end
  end

  private

    def age ( birthdate )
      today = Date.today
      ( ( ( today - birthdate) / 365.25 ).to_f )
    end

    def baby_siad ( faq_score, minimental_score, age, education )
      [0, 90.0]
    end

    def validate_tests
      test_faq = @consultation.test_faqs.first
      test_minimental = @consultation.test_minimentals.first
      @faq_score = ( test_faq ? test_faq.score : nil )
      @minimental_score = ( test_minimental ? test_minimental.score : nil )
    end

end
