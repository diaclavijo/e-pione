class QuickTestFaqsController < QuickTestsController

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_faq_params
      params.require(:test_faq).permit(:f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :consultation_id, :score)
    end
end
