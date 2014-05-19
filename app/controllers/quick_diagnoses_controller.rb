class QuickDiagnosesController < ApplicationControllerSigned


  # GET /quick_diagnoses/new
  def new
    redirect_to new_fototest_path if current_physician.default_test == 'fototest'
    @computer_diagnosis = current_physician.computer_diagnoses.build
  end


  # POST /quick_diagnoses
  # POST /quick_diagnoses.json
  def create
    # In case the Physician has introduced the mmse_score directly through the interface, is necessary to update score in the session
    session[:minimental_score] = params[:computer_diagnosis][:mmse_score]
    session[:faq_score] = params[:computer_diagnosis][:faq_score]


    @computer_diagnosis = current_physician.computer_diagnoses.build quick_diagnosis_params

		if @computer_diagnosis.valid_siad_exec?
			@computer_diagnosis.diagnosis, @computer_diagnosis.probability = siad faq_score:    @computer_diagnosis.faq_score,
																																						 mmse: 				@computer_diagnosis.mmse_score,
																																						 age:         @computer_diagnosis.age,
																																						 education:   @computer_diagnosis.education
			siad_error = true unless ( @computer_diagnosis.diagnosis && @computer_diagnosis.probability )

		end

    respond_to do |format|
			if siad_error
				flash[:alert]= 'Ha habido un error. Por favor contacte a los administradores. '
				format.html { redirect_to new_quick_diagnosis_path}
			else
				if @computer_diagnosis.save
					session.delete(:minimental_score)
					session.delete(:faq_score)
          format.html { redirect_to correct_quick_diagnosis_path(@computer_diagnosis)	}

        else
					format.html { render action: 'new' }
				end
			end


    end
	end

	def correct
		@computer_diagnosis = current_physician.computer_diagnoses.find(params[:id])
		@url = quick_diagnosis_path @computer_diagnosis
	end

	def update
		@computer_diagnosis = current_physician.computer_diagnoses.find(params[:id])
		respond_to do |format|
			if @computer_diagnosis.update(diagnosis_correct_params)
				format.html { redirect_to new_quick_diagnosis_path}
			else
				format.html { render action: 'correct' }
			end
		end
	end


  private

		include Siad

    # Never trust parameters from the scary internet, only allow the white list through.
    def quick_diagnosis_params
      params.require(:computer_diagnosis).permit(:faq_score,
                                              :education,
                                              :mmse_score,
                                              :age,
                                              :education_select,
																							:correct)
		end

		def diagnosis_correct_params
			params.require(:computer_diagnosis).permit(:correct)
		end
end
