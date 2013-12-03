class TestKatzsController < TestsController
  before_action :set_test_katz, only: [:show, :edit, :update, :destroy]

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_test_katz
    @test_katz = TestKatz.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def test_katz_params
    params.require(:test_katz).permit(:f1)
  end
end
