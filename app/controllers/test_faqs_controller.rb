class TestFaqsController < TestsController
  before_action :set_test_faq, only: [:show, :edit, :update, :destroy]

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_faq
      @test_faq = TestFaq.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_faq_params
      params.require(:test_faq).permit(:f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :consultation_id)
    end
end
