class TestIqcodesController < TestsController
  before_action :set_test_iqcode, only: [:show, :edit, :update, :destroy]



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_iqcode
      @test_iqcode = TestIqcode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_iqcode_params
      params.require(:test_iqcode).permit(:first, :second, :third, :forth, :fifth, :sixth, :seventh, :eighth, :ninth, :tenth, :eleventh, :twelfth, :thirteenth, :fourteenth, :fifteenth, :sixteenth, :seventeenth, :consultation_id)
    end
end
