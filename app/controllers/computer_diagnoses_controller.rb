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
      @computer_diagnosis = @consultation.computer_diagnoses.build(
															diagnosis:   diagnosis,
													    probability: probability,
														 	faq_score:   @test_faq.score,
														 	mmse_score:  @test_minimental.score,
														 	education:   education,
														 	age:         age,
															physician_id: current_physician.id
														) unless diagnosis.nil?
    end

    respond_to do |format|
      if @test_faq && @test_minimental  then
        if diagnosis.nil?
          flash.now[:alert] = t('errors.computer_diagnosis.alert.fail')
          format.html { render action: 'new' }
        elsif @computer_diagnosis.save
          format.html { redirect_to correct_consultation_computer_diagnosis_path(@consultation,@computer_diagnosis),
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


	def correct
		@computer_diagnosis = @consultation.computer_diagnoses.find(params[:id])
		@url = consultation_computer_diagnosis_path @consultation, @computer_diagnosis

	end

	def update
		@computer_diagnosis = @consultation.computer_diagnoses.find(params[:id])
		respond_to do |format|
			if @computer_diagnosis.update(diagnosis_correct_params)
				format.html { redirect_to new_consultation_human_diagnosis_path(@consultation)}
			else
				format.html { render action: 'correct' }
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
      @test_faq = @consultation.test_faqs.last
      @test_minimental = @consultation.test_minimentals.last
		end

		def diagnosis_correct_params
			params.require(:computer_diagnosis).permit(:correct)
		end

end
