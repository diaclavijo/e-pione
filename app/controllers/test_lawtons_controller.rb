class TestLawtonsController < TestsController
  before_action :set_test_lawton, only: [:show, :edit, :update, :destroy]

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_test_lawton
    @test_lawton = TestLawton.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def test_lawton_params
    params.require(:test_lawton).permit(:f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8)
  end
end
