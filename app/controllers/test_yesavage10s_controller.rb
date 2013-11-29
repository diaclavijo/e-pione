class TestYesavage10sController < ConsultationResourcesController
  before_action :set_test_yesavage10, only: [:show, :edit, :destroy]

  # GET /test_yesavage10s/1
  # GET /test_yesavage10s/1.json
  def show
  end

  # GET /test_yesavage10s/new
  def new
    @test_yesavage10 = @consultation.test_yesavage10s.build
  end


  # POST /test_yesavage10s
  # POST /test_yesavage10s.json
  def create
    @test_yesavage10 = @consultation.test_yesavage10s.build test_yesavage10_params

    respond_to do |format|
      if @test_yesavage10.save
        format.html { redirect_to [@consultation, :no_cognitive_symptomatology], notice: 'Test yesavage10 was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_yesavage10 }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_yesavage10.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /test_yesavage10s/1
  # DELETE /test_yesavage10s/1.json
  def destroy
    @test_yesavage10.destroy
    respond_to do |format|
      format.html { redirect_to test_yesavage10s_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_yesavage10
      @test_yesavage10 = TestYesavage10.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_yesavage10_params
      params.require(:test_yesavage10).permit(:f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :consultation_id)
    end
end
