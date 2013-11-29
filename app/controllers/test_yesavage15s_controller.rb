class TestYesavage15sController < ConsultationResourcesController
  before_action :set_test_yesavage15, only: [:show, :edit, :destroy]

  # GET /test_yesavage15s/1
  # GET /test_yesavage15s/1.json
  def show
  end

  # GET /test_yesavage15s/new
  def new
    @test_yesavage15 = @consultation.test_yesavage15s.build
  end

  # POST /test_yesavage15s
  # POST /test_yesavage15s.json
  def create
    @test_yesavage15 = @consultation.test_yesavage15s.build test_yesavage15_params

    respond_to do |format|
      if @test_yesavage15.save
        format.html { redirect_to [@consultation, :no_cognitive_symptomatology], notice: 'Test yesavage15 was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_yesavage15 }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_yesavage15.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /test_yesavage15s/1
  # DELETE /test_yesavage15s/1.json
  def destroy
    @test_yesavage15.destroy
    respond_to do |format|
      format.html { redirect_to test_yesavage15s_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_yesavage15
      @test_yesavage15 = TestYesavage15.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_yesavage15_params
      params.require(:test_yesavage15).permit(:f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :f11, :f12, :f13, :f14, :f15, :consultation_id)
    end
end
