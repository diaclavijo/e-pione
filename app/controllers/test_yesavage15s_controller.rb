class TestYesavage15sController < TestsController
  before_action :set_test_yesavage15, only: [:show, :edit, :destroy]


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
