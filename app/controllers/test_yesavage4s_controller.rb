class TestYesavage4sController < TestsController
  before_action :set_test_yesavage4, only: [:show, :edit, :destroy]

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
