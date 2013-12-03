class TestYesavage10sController < TestsController
  before_action :set_test_yesavage10, only: [:show, :edit, :destroy]

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
