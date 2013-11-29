class TestYesavage4sController < TestsController
  before_action :set_test_yesavage4, only: [:show, :edit, :destroy]

  # GET /test_yesavage4s/1
  # GET /test_yesavage4s/1.json
  def show
  end

  # POST /test_yesavage4s
  # POST /test_yesavage4s.json
  def create
    @test_yesavage4 = @consultation.test_yesavage4s.build test_yesavage4_params

    respond_to do |format|
      if @test_yesavage4.save
        format.html { redirect_to [@consultation, :no_cognitive_symptomatology], notice: 'Test yesavage4 was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_yesavage4 }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_yesavage4.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /test_yesavage4s/1
  # DELETE /test_yesavage4s/1.json
  def destroy
    @test_yesavage4.destroy
    respond_to do |format|
      format.html { redirect_to test_yesavage4s_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_yesavage4
      @test_yesavage4 = TestYesavage4.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_yesavage4_params
      params.require(:test_yesavage4).permit(:first, :second, :third, :forth, :consultation_id)
    end
end
