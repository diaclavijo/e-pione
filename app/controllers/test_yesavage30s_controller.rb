class TestYesavage30sController < TestsController
  before_action :set_test_yesavage30, only: [:show, :edit, :destroy]



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
