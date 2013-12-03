class TestMinimentalsController < TestsController
  before_action :set_test_minimental, only: [:show, :edit, :update, :destroy]

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_minimental
      @test_minimental = TestMinimental.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_minimental_params
      params.require(:test_minimental).permit(:year, :station, :day_month, :day_week, :month, :country, :province, :city, :where, :flat, :objects, :attention, :memory, :pencil, :repeat, :orders, :eyes, :sentence, :draw)
    end
end
