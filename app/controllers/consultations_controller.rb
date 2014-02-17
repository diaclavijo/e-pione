class ConsultationsController < ApplicationControllerSigned
  before_action :set_consultation, only: [:show, :edit, :update, :destroy]
  layout  "consultation_resources", only: [:show]

  # GET /consultations
  # GET /consultations.json
  def index
    @patient = Patient.find(params[:patient_id])
    @consultations = @patient.consultations
  end

  # GET /consultations/1
  # GET /consultations/1.json
  def show
    @patient = Patient.find(params[:patient_id])
    @consultation = @patient.consultations.find params[:id]

  end

  # GET /consultations/new
  def new
    @patient = Patient.find(params[:patient_id])
    @consultation = Consultation.new
  end

  # GET /consultations/1/edit
  def edit
  end

  # POST /consultations
  # POST /consultations.json
  def create
    @consultation = Consultation.new(consultation_params)
    @patient = Patient.find(params[:patient_id])
    @consultation.patient_id = params[:patient_id]
    @consultation.physician_id = current_physician.id

    respond_to do |format|
      if @consultation.save
        format.html { redirect_to [@patient,@consultation], notice: 'Consulta creada con éxito' }
        format.json { render action: 'show', status: :created, location: @consultation }
      else
        format.html { render action: 'new' }
        format.json { render json: @consultation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consultations/1
  # PATCH/PUT /consultations/1.json
  def update
    respond_to do |format|
      if @consultation.update(consultation_params)
        format.html { redirect_to @consultation, notice: 'Consultation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @consultation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consultations/1
  # DELETE /consultations/1.json
  def destroy
    @consultation.destroy
    respond_to do |format|
      format.html { redirect_to consultations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consultation
      @consultation = Consultation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consultation_params
      params.require(:consultation).permit(:Patient_id, :Physician_id, :activity, :date, :description)
    end
end
