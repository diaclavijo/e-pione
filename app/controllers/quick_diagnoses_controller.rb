class QuickDiagnosesController < ApplicationController

  # GET /quick_diagnoses
  # GET /quick_diagnoses.json
  def index
    @quick_diagnoses = QuickDiagnosis.all
  end

  # GET /quick_diagnoses/new
  def new
    @quick_diagnosis = current_physician.quick_diagnoses.build
  end


  # POST /quick_diagnoses
  # POST /quick_diagnoses.json
  def create
    @quick_diagnosis = current_physician.quick_diagnoses.build quick_diagnosis_params

		if @quick_diagnosis.valid?
			@quick_diagnosis.diagnosis, @quick_diagnosis.probability = siad faq_score:    @quick_diagnosis.faq_score,
																																			 mmse: 				@quick_diagnosis.mmse_score,
																																			 age:         @quick_diagnosis.age,
																																			 education:   @quick_diagnosis.education
			siad_error = true unless ( @quick_diagnosis.diagnosis && @quick_diagnosis.probability )

		end

    respond_to do |format|
			if siad_error
				flash[:alert]= 'Ha habido un error. Por favor contacte a los administradores. '
				format.html { redirect_to new_quick_diagnosis_path}
			else
				if @quick_diagnosis.save
					session.delete(:minimental_score)
					session.delete(:faq_score)
					format.html { render action:'show'}
				else
					format.html { render action: 'new' }
				end
			end


    end
  end

  def show

  end

  private

		include Siad

    # Never trust parameters from the scary internet, only allow the white list through.
    def quick_diagnosis_params
      params.require(:quick_diagnosis).permit(:faq_score,
                                              :education,
                                              :mmse_score,
                                              :age,
                                              :education_select)
    end
end
