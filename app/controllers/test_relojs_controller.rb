class TestRelojsController < ConsultationResourcesController
  before_action :set_test_reloj, only: [:show, :edit, :update, :destroy]

  # GET /test_relojs/1
  # GET /test_relojs/1.json
  def show
  end

  # GET /test_relojs/new
  def new
    @test_reloj = @consultation.test_relojs.build
  end

  # POST /test_relojs
  # POST /test_relojs.json
  def create
    @test_reloj = @consultation.test_relojs.build test_reloj_params

    respond_to do |format|
      if @test_reloj.save
        format.html { redirect_to [@consultation, :cognitive_symptomatology], notice: 'Test npi was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_reloj }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_reloj.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /test_relojs/1
  # DELETE /test_relojs/1.json
  def destroy
    @test_reloj.destroy
    respond_to do |format|
      format.html { redirect_to test_relojs_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_test_reloj
    @test_reloj = TestReloj.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def test_reloj_params
    params.require(:test_reloj).permit(:f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :f11, :f12, :f13, :consultation_id)
  end
end
