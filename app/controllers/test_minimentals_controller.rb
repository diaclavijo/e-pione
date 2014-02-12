class TestMinimentalsController < TestsController
  before_action :set_test_minimental, only: [:show, :edit, :update, :destroy]

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_minimental
      @test_minimental = TestMinimental.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_minimental_params
      params.require(:test_minimental).permit(:f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :f11, :f12, :f13, :f14, :f15, :f16, :f17, :f18, :f19)
    end
end
