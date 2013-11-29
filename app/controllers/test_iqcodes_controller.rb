class TestIqcodesController < TestsController
  before_action :set_test_iqcode, only: [:show, :edit, :update, :destroy]

  # GET /test_iqcodes/1
  # GET /test_iqcodes/1.json
  def show
  end


  # POST /test_iqcodes
  # POST /test_iqcodes.json
  def create
    @test_iqcode = @consultation.test_iqcodes.build test_iqcode_params

    respond_to do |format|
      if @test_iqcode.save
        format.html { redirect_to [@consultation,:cognitive_symptomatology], notice: 'Test iqcode was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_iqcode }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_iqcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /consultation/1/test_iqcode/1/edit
  def edit
  end


  # PATCH/PUT /test_iqcodes/1
  def update
    respond_to do |format|
      if @test_iqcode.update(test_iqcode_params)
        format.html { redirect_to [@consultation, @test_iqcode], notice: 'Test iqcode was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @test_iqcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_iqcodes/1
  # DELETE /test_iqcodes/1.json
  def destroy
    @test_iqcode.destroy
    respond_to do |format|
      format.html { redirect_to test_iqcodes_url }
      format.json { head :no_content }
    end
  end

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
