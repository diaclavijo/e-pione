class TestPfeiffersController < TestsController
  before_action :set_test_pfeiffer, only: [:show, :edit, :update, :destroy]


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_test_pfeiffer
    @test_pfeiffer = TestPfeiffer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def test_pfeiffer_params
    params.require(:test_pfeiffer).permit(:f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :f11, :f12, :f13, :consultation_id)
  end
end







