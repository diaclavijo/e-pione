class NeurologicalExaminationsController < ConsultationResourcesController
  before_action :set_neurological_examination, only: [:show, :edit, :update, :destroy]

  # GET /neurological_examinations/1
  # GET /neurological_examinations/1.json
  def show
  end

  # GET /consultations/1/cognitive_symptomatology
  def new_or_edit
    @neurological_examination =
        ( @consultation.neurological_examination or
            @consultation.build_neurological_examination )

  end

  # POST /neurological_examinations
  # POST /neurological_examinations.json
  def create
    @neurological_examination = @consultation.build_neurological_examination(neurological_examination_params)

    respond_to do |format|
      if @neurological_examination.save
        format.html { redirect_to [@consultation, :neurological_examination], notice: 'Neurological examination was successfully created.' }
        format.json { render action: 'show', status: :created, location: @neurological_examination }
      else
        format.html { render action: 'new_or_edit' }
        format.json { render json: @neurological_examination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /neurological_examinations/1
  # PATCH/PUT /neurological_examinations/1.json
  def update
    respond_to do |format|
      if @neurological_examination.update(neurological_examination_params)
        format.html { redirect_to  [@consultation, :neurological_examination], notice: 'Neurological examination was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'new_or_edit' }
        format.json { render json: @neurological_examination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /neurological_examinations/1
  # DELETE /neurological_examinations/1.json
  def destroy
    @neurological_examination.destroy
    respond_to do |format|
      format.html { redirect_to neurological_examinations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_neurological_examination
      @neurological_examination = @consultation.neurological_examination
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def neurological_examination_params
      params.require(:neurological_examination).permit(:f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :f11, :f12, :f13, :f14, :f15, :f16, :f17, :f18, :f19, :f20, :f21, :f22, :f23, :f24, :f25, :f26, :f27, :f28, :f29, :f30, :f31, :f32, :f33, :f34, :f35, :f36, :f37, :consultation_id)
    end
end
