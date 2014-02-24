class ComputerDiagnosesController < ConsultationResourcesController


  def new
    validate_tests
  end

  # GET /diagnoses
  # GET /diagnoses.json
  def create
    validate_tests

    if @test_faq && @test_minimental
      age = age @consultation.patient.birth
      education = @consultation.patient.education
      diagnosis, probability = baby_siad faq_score:        @test_faq.score,
                                         minimental_score: @test_minimental.score,
                                         age:              age,
                                         education:        education
      @computer_diagnosis = @consultation.computer_diagnoses.build( diagnosis: diagnosis,
                                                                   probability: probability ) unless diagnosis.nil?
    end

    respond_to do |format|
      if @test_faq && @test_minimental  then
        if diagnosis.nil?
          flash.now[:alert] = t('errors.computer_diagnosis.alert.fail')
          format.html { render action: 'new' }
        elsif @computer_diagnosis.save
          format.html { redirect_to [:new, @consultation, :human_diagnoses],
                                    notice: t('errors.computer_diagnosis.notice.diagnosis-saved') }
        else
          flash.now[:alert] = t('errors.computer_diagnosis.alert.failed-save')
          format.html { render action: 'new'}
        end

      else
        flash.now[:alert] = t('errors.computer_diagnosis.alert.need-tests')
        format.html { render action: 'new'}
      end
    end
  end

  private

    def age ( birthdate )
      today = Date.today
      ( ( ( today - birthdate) / 365.25 ).to_f )
    end
    # This function is critical. Therefore keyword args are used
    PYTHON_SCRIPT = 'deployment_ejemplo.py'
    def baby_siad (faq_score: nil, minimental_score: nil, age: nil, education: nil )
      return nil unless faq_score && minimental_score && age && education # all the args are mandatory
      result = `python #{PYTHON_SCRIPT} age:#{age} educ:#{education} faq:#{faq_score} ldeltotal:#{minimental_score}`
      output_reg = /(\d)\s+(\d+\.\d+)/
      if output_reg.match result
        diagnosis = $1.to_i
        probability = $2.to_f
        [ diagnosis, probability ]
      else
        nil
      end
    end

    def validate_tests
      @test_faq = @consultation.test_faqs.first
      @test_minimental = @consultation.test_minimentals.first
    end

end
