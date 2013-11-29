class TestBarthelsController < TestsController
  before_action :set_test_barthel, only: [:show, :edit, :update, :destroy]

  # GET /test_barthels/1
  # GET /test_barthels/1.json
  def show
  end

  # POST /test_barthels
  # POST /test_barthels.json
  def create
    @test_barthel = @consultation.test_barthels.build test_barthel_params

    respond_to do |format|
      if @test_barthel.save
        format.html { redirect_to [@consultation, :exploracion_funcional], notice: 'Test barthel was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_barthel }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_barthel.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /test_barthels/1
  # DELETE /test_barthels/1.json
  def destroy
    @test_barthel.destroy
    respond_to do |format|
      format.html { redirect_to test_barthels_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_test_barthel
    @test_barthel = TestBarthel.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def test_barthel_params
    params.require(:test_barthel).permit(:f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :f11, :f12, :f13, :consultation_id)
  end
end
