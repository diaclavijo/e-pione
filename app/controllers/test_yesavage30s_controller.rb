class TestYesavage30sController < ConsultationResourcesController
  before_action :set_test_yesavage30, only: [:show, :edit, :destroy]

  # GET /test_yesavage30s/1
  # GET /test_yesavage30s/1.json
  def show
  end

  # GET /test_yesavage30s/new
  def new
    @test_yesavage30 = @consultation.test_yesavage30s.build
  end

  # POST /test_yesavage30s
  # POST /test_yesavage30s.json
  def create
    @test_yesavage30 = @consultation.test_yesavage30s.build test_yesavage30_params

    respond_to do |format|
      if @test_yesavage30.save
        format.html { redirect_to [@consultation, :no_cognitive_symptomatology], notice: 'Test yesavage30 was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_yesavage30 }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_yesavage30.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_yesavage30s/1
  # DELETE /test_yesavage30s/1.json
  def destroy
    @test_yesavage30.destroy
    respond_to do |format|
      format.html { redirect_to test_yesavage30s_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_yesavage30
      @test_yesavage30 = TestYesavage30.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_yesavage30_params
      params.require(:test_yesavage30).permit(:f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :f11, :f12, :f13, :f14, :f15, :f16, :f17, :f18, :f19, :f20, :f21, :f22, :f23, :f24, :f25, :f26, :f27, :f28, :f29, :f30, :consultation_id)
    end
end
