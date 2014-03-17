class ComputerDiagnosesController < ConsultationResourcesController


  def new
    validate_tests
    @patient = @consultation.patient
  end

  # GET /diagnoses
  # GET /diagnoses.json
  def create
    validate_tests
    @patient = @consultation.patient
    if @test_faq && @test_minimental
      age = age @consultation.patient.birth


      education = @consultation.patient.education
      diagnosis, probability = siad faq_score:        @test_faq.score,
                                         mmse: @test_minimental.score,
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

    include Siad

    def validate_tests
      @test_faq = @consultation.test_faqs.first
      @test_minimental = @consultation.test_minimentals.first
    end

end
