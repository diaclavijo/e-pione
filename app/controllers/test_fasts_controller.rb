class TestFastsController < TestsController
  before_action :set_test_fast, only: [:show, :edit, :update, :destroy]

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_test_fast
    @test_fast = TestFast.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def test_fast_params
    params.require(:test_fast).permit(:f1)
  end
end
