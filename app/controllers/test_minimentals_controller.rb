class TestMinimentalsController < ConsultationResourcesController
  before_action :set_test_minimental, only: [:show, :edit, :update, :destroy]

  # GET /test_minimentals/1
  # GET /test_minimentals/1.json
  def show
  end

  # GET /consultation/:consultation_id/test_minimentals/new
  def new
    @test_minimental = @consultation.test_minimentals.build
  end


  # POST /consultation/:consultation_id/test_minimentals
  def create
    @test_minimental = @consultation.test_minimentals.build test_minimental_params

    respond_to do |format|
      if @test_minimental.save
        format.html { redirect_to [@consultation, :cognitive_symptomatology], notice: 'Test minimental was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_minimental }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_minimental.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /test_minimentals/1
  # DELETE /test_minimentals/1.json
  def destroy
    @test_minimental.destroy
    respond_to do |format|
      format.html { redirect_to test_minimentals_url }
      format.json { head :no_content }
    end
  end

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
