class PatientsController < ApplicationController

  before_filter :authenticate_physician!

  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    if params[:search]
      @patients = Patient.search(params[:search], params[:search_type]).page params[:page]
    else
      @patients = Patient.page params[:page]
    end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        flash[:success]="Paciente creado con éxito"
        format.html { redirect_to patient_consultations_path(@patient.id) }
        format.json { render action: 'show', status: :created, location: @patient }
      else
        format.html { render action: 'new' }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        flash[:success]="Paciente actualizado con éxito"
        format.html { redirect_to patients_path}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:surname, :name, :birth, :gender, :civil_status, :NIF, :passport, :public_insurance_number, :private_insurance_number, :exitus, :phone_house, :mobile_phone, :other_phone, :address, :city, :state, :country, :education, :occupation, :employment, :economic_situation, :institutionalized, :search)
    end
end
