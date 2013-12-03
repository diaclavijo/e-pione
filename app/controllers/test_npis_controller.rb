class TestNpisController < TestsController
  before_action :set_test_npi, only: [:show, :edit, :update, :destroy]


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_npi
      @test_npi = TestNpi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_npi_params
      params.require(:test_npi).permit(:f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :f11, :f12, :f13, :f14, :f15, :f16, :f17, :f18, :f19, :f20, :f21, :f22, :f23, :f24, :f25, :f26, :f27, :f28, :f29, :f30, :f31, :f32, :f33, :f34, :f35, :f36, :consultation_id)
    end
end
