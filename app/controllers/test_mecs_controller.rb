class TestMecsController < TestsController
  before_action :set_test_mec, only: [:show, :edit, :update, :destroy]

  # GET /test_mecs/1
  # GET /test_mecs/1.json
  def show
  end




  # DELETE /test_mecs/1
  # DELETE /test_mecs/1.json
  def destroy
    @test_mec.destroy
    respond_to do |format|
      format.html { redirect_to test_mecs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_mec
      @test_mec = TestMec.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_mec_params
      params.require(:test_mec).permit(:f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :f11, :f12, :f13, :consultation_id)
    end
end
