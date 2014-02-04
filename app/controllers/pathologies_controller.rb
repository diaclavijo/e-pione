class PathologiesController < ConsultationResourcesController
  before_action :set_pathology, only: [:destroy]

  # GET /pathologies
  # GET /pathologies.json
  def index
    @pathologies = @consultation.patient.pathologies.order(created_at: :desc)
    @pathology = @consultation.pathologies.build
  end


  # POST /pathologies
  # POST /pathologies.json
  def create
    @pathology = @consultation.pathologies.build pathology_params

    respond_to do |format|
      if @pathology.save
        format.js {}
      else
        format.html { render action: 'new' }
        format.json { render json: @pathology.errors, status: :unprocessable_entity }

      end
    end
  end



  # DELETE /pathologies/1
  # DELETE /pathologies/1.json
  def destroy
    @pathology.destroy
    respond_to do |format|
      format.js{ }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pathology
      @pathology = Pathology.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pathology_params
      params.require(:pathology).permit(:pathology)
    end
end
