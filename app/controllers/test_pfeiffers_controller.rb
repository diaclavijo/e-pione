class TestPfeiffersController < ConsultationResourcesController
  before_action :set_test_pfeiffer, only: [:show, :edit, :update, :destroy]

  # GET /test_pfeiffers/1
  # GET /test_pfeiffers/1.json
  def show
  end

  # GET /test_pfeiffers/new
  def new
    @test_pfeiffer = @consultation.test_pfeiffers.build
  end

  # POST /test_pfeiffers
  # POST /test_pfeiffers.json
  def create
    @test_pfeiffer = @consultation.test_pfeiffers.build test_pfeiffer_params

    respond_to do |format|
      if @test_pfeiffer.save
        format.html { redirect_to [@consultation, :cognitive_symptomatology], notice: 'Test npi was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_pfeiffer }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_pfeiffer.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /test_pfeiffers/1
  # DELETE /test_pfeiffers/1.json
  def destroy
    @test_pfeiffer.destroy
    respond_to do |format|
      format.html { redirect_to test_pfeiffers_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_test_pfeiffer
    @test_pfeiffer = TestPfeiffer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def test_pfeiffer_params
    params.require(:test_pfeiffer).permit(:f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :f11, :f12, :f13, :consultation_id)
  end
end







