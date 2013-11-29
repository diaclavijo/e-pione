class CognitiveSymptomatologiesController < ExaminationsController
  before_action :set_cognitive_symptomatology, only: [:show, :update, :destroy]


  # GET /cognitive_symptomatologies/1
  # GET /cognitive_symptomatologies/1.json
  def show
  end

  # GET /consultations/1/cognitive_symptomatology
  def new_or_edit
    @cognitive_symptomatology =
        ( @consultation.cognitive_symptomatology or
          @consultation.build_cognitive_symptomatology )


  end

  # POST /consultations/1/cognitive_symptomatology
  # POST /cognitive_symptomatologies.json
  def create
    @cognitive_symptomatology = @consultation.build_cognitive_symptomatology(cognitive_symptomatology_params)

    respond_to do |format|
      if @cognitive_symptomatology.save
        format.html { redirect_to [@consultation, :cognitive_symptomatology], notice: 'Cognitive examination was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cognitive_symptomatology }
      else
        format.html { render action: 'new_or_edit' }
        format.json { render json: @cognitive_symptomatology.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cognitive_symptomatologies/1
  # PATCH/PUT /cognitive_symptomatologies/1.json
  def update
    respond_to do |format|
      if @cognitive_symptomatology.update(cognitive_symptomatology_params)
        format.html { redirect_to consultation_cognitive_symptomatology_path(@consultation), notice: 'Cognitive examination was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'new_or_edit' }
        format.json { render json: @cognitive_symptomatology.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cognitive_symptomatologies/1
  # DELETE /cognitive_symptomatologies/1.json
  def destroy
    @cognitive_symptomatology.destroy
    respond_to do |format|
      format.html { redirect_to cognitive_symptomatologies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cognitive_symptomatology
      @cognitive_symptomatology = @consultation.cognitive_symptomatology
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cognitive_symptomatology_params
      params.require(:cognitive_symptomatology).permit(:consultation_id, :memory, :disorientation, :aphasia, :apraxia, :agnosia, :executive, :reasoning, :spatial)
    end
end
