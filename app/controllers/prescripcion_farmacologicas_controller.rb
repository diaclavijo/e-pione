class PrescripcionFarmacologicasController < ApplicationController
  before_action :set_prescripcion_farmacologica, only: [:show, :edit, :update, :destroy]

  # GET /prescripcion_farmacologicas
  # GET /prescripcion_farmacologicas.json
  def index
    @prescripcion_farmacologicas = PrescripcionFarmacologica.all
  end

  # GET /prescripcion_farmacologicas/1
  # GET /prescripcion_farmacologicas/1.json
  def show
  end

  # GET /prescripcion_farmacologicas/new
  def new
    @prescripcion_farmacologica = PrescripcionFarmacologica.new
  end

  # GET /prescripcion_farmacologicas/1/edit
  def edit
  end

  # POST /prescripcion_farmacologicas
  # POST /prescripcion_farmacologicas.json
  def create
    @prescripcion_farmacologica = PrescripcionFarmacologica.new(prescripcion_farmacologica_params)

    respond_to do |format|
      if @prescripcion_farmacologica.save
        format.html { redirect_to @prescripcion_farmacologica, notice: 'Prescripcion farmacologica was successfully created.' }
        format.json { render action: 'show', status: :created, location: @prescripcion_farmacologica }
      else
        format.html { render action: 'new' }
        format.json { render json: @prescripcion_farmacologica.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prescripcion_farmacologicas/1
  # PATCH/PUT /prescripcion_farmacologicas/1.json
  def update
    respond_to do |format|
      if @prescripcion_farmacologica.update(prescripcion_farmacologica_params)
        format.html { redirect_to @prescripcion_farmacologica, notice: 'Prescripcion farmacologica was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @prescripcion_farmacologica.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prescripcion_farmacologicas/1
  # DELETE /prescripcion_farmacologicas/1.json
  def destroy
    @prescripcion_farmacologica.destroy
    respond_to do |format|
      format.html { redirect_to prescripcion_farmacologicas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prescripcion_farmacologica
      @prescripcion_farmacologica = PrescripcionFarmacologica.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prescripcion_farmacologica_params
      params.require(:prescripcion_farmacologica).permit(:tipo, :prescripcion)
    end
end
