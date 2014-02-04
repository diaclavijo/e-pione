class HabitosController < ConsultationResourcesController
  before_action :set_habito, only: [:destroy]

  # GET /habitos
  # GET /habitos.json
  def index
    @habitos = @consultation.patient.habitos.order(created_at: :desc)
    @habito = @consultation.habitos.build
  end


  # POST /habitos
  # POST /habitos.json
  def create
    @habito = @consultation.habitos.build habitos_params

    respond_to do |format|
      if @habito.save
        format.js {}
      else
        format.html { render action: 'new' }
        format.json { render json: @habito.errors, status: :unprocessable_entity }

      end
    end
  end



  # DELETE /habitos/1
  # DELETE /habitos/1.json
  def destroy
    @habito.destroy
    respond_to do |format|
      format.js{ }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_habito
      @habito = Habito.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def habitos_params
      params.require(:habito).permit(:habito, :comentario)
    end
end
