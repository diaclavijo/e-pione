class PhysicalExaminationsController < ConsultationResourcesController
  before_action :set_physical_examination, only: [:show, :edit, :update, :destroy]

  # GET /physical_examinations/1
  # GET /physical_examinations/1.json
  def show
  end

  # GET /physical_examinations/new
  def new_or_edit
     @physical_examination =
        ( @consultation.physical_examination or
            @consultation.build_physical_examination )
  end

  # POST /physical_examinations
  # POST /physical_examinations.json
  def create
    @physical_examination = @consultation.build_physical_examination(physical_examination_params)

    respond_to do |format|
      if @physical_examination.save
        format.html { redirect_to [@consultation, :physical_examination ] , notice: 'Physical examination was successfully created.' }
        format.json { render action: 'show', status: :created, location: @physical_examination }
      else
        format.html { render action: 'new_or_edit' }
        format.json { render json: @physical_examination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /physical_examinations/1
  # PATCH/PUT /physical_examinations/1.json
  def update
    respond_to do |format|
      if @physical_examination.update(physical_examination_params)
        format.html { redirect_to [@consultation, :physical_examination ], notice: 'Physical examination was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'new_or_edit' }
        format.json { render json: @physical_examination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /physical_examinations/1
  # DELETE /physical_examinations/1.json
  def destroy
    @physical_examination.destroy
    respond_to do |format|
      format.html { redirect_to physical_examinations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_physical_examination
      @physical_examination = @consultation.physical_examination
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def physical_examination_params
      params.require(:physical_examination).permit(:talla, :peso, :tension, :f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :f11, :f12, :f13, :f14, :consultation_id)
    end
end
