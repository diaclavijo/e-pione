class PruebasController < ConsultationResourcesController
  before_action :set_prueba, only: [:destroy]

  # GET /pruebas
  # GET /pruebas.json
  def index
    @pruebas = @consultation.patient.pruebas.order(created_at: :desc)
    @prueba = @consultation.pruebas.build
  end


  # POST /pruebas
  # POST /pruebas.json
  def create
    @prueba = @consultation.pruebas.build prueba_params

    respond_to do |format|
      if @prueba.save
        format.js {}
      else
        format.html { render action: 'new' }
        format.json { render json: @prueba.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pruebas/1
  # DELETE /pruebas/1.json
  def destroy
    @prueba.destroy
    respond_to do |format|
      format.js{ }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prueba
      @prueba = Prueba.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prueba_params
      params.require(:prueba).permit(:prueba)
    end
end
