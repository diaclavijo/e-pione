class QuickDiagnosesController < ApplicationController
  before_action :set_quick_diagnosis, only: [:show, :edit, :update, :destroy]

  # GET /quick_diagnoses
  # GET /quick_diagnoses.json
  def index
    @quick_diagnoses = QuickDiagnosis.all
  end

  # GET /quick_diagnoses/new
  def new
    @quick_diagnosis = QuickDiagnosis.new
  end


  # POST /quick_diagnoses
  # POST /quick_diagnoses.json
  def create
    @quick_diagnosis = QuickDiagnosis.new(quick_diagnosis_params)

    respond_to do |format|
      if @quick_diagnosis.save
        format.html { redirect_to @quick_diagnosis, notice: 'Quick diagnosis was successfully created.' }
        format.json { render action: 'show', status: :created, location: @quick_diagnosis }
      else
        format.html { render action: 'new' }
        format.json { render json: @quick_diagnosis.errors, status: :unprocessable_entity }
      end
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quick_diagnosis
      @quick_diagnosis = QuickDiagnosis.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quick_diagnosis_params
      params.require(:quick_diagnosis).permit(:diagnosis, :probability, :score_faq, :education, :score_mmse, :age)
    end
end
