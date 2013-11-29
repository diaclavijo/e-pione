class TestNpisController < ConsultationResourcesController
  before_action :set_test_npi, only: [:show, :edit, :update, :destroy]

  # GET /test_npis/1
  # GET /test_npis/1.json
  def show
  end

  # GET /test_npis/new
  def new
    @test_npi = @consultation.test_npis.build
  end

  # POST /test_npis
  # POST /test_npis.json
  def create
    @test_npi = @consultation.test_npis.build test_npi_params

    respond_to do |format|
      if @test_npi.save
        format.html { redirect_to [@consultation, :no_cognitive_symptomatology], notice: 'Test npi was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_npi }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_npi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_npis/1
  # DELETE /test_npis/1.json
  def destroy
    @test_npi.destroy
    respond_to do |format|
      format.html { redirect_to test_npis_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_npi
      @test_npi = TestNpi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_npi_params
      params.require(:test_npi).permit(:f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :f11, :f12, :f13, :f14, :f15, :f16, :f17, :f18, :f19, :f20, :f21, :f22, :f23, :f24, :f25, :f26, :f27, :f28, :f29, :f30, :f31, :f32, :f33, :f34, :f35, :f36, :consultation_id)
    end
end
