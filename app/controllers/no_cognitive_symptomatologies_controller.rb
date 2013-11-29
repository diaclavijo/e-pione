class NoCognitiveSymptomatologiesController < ConsultationResourcesController
  before_action :set_no_cognitive_symptomatology, only: [:show, :edit, :update, :destroy]

  # GET /no_cognitive_symptomatologies/1
  # GET /no_cognitive_symptomatologies/1.json
  def show
  end

  def new_or_edit
    @no_cognitive_symptomatology =
        ( @consultation.no_cognitive_symptomatology or
            @consultation.build_no_cognitive_symptomatology )
  end

  # POST /no_cognitive_symptomatologies
  # POST /no_cognitive_symptomatologies.json
  def create
    @no_cognitive_symptomatology = @consultation.build_no_cognitive_symptomatology(no_cognitive_symptomatology_params)


    respond_to do |format|
      if @no_cognitive_symptomatology.save
        format.html { redirect_to [@consultation, :no_cognitive_symptomatology], notice: 'No cognitive symptomatology was successfully created.' }
        format.json { render action: 'show', status: :created, location: @no_cognitive_symptomatology }
      else
        format.html { render action: 'new_or_edit' }
        format.json { render json: @no_cognitive_symptomatology.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /no_cognitive_symptomatologies/1
  # PATCH/PUT /no_cognitive_symptomatologies/1.json
  def update
    respond_to do |format|
      if @no_cognitive_symptomatology.update(no_cognitive_symptomatology_params)
        format.html { redirect_to [@consultation, :no_cognitive_symptomatology], notice: 'No cognitive symptomatology was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'new_or_edit' }
        format.json { render json: @no_cognitive_symptomatology.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /no_cognitive_symptomatologies/1
  # DELETE /no_cognitive_symptomatologies/1.json
  def destroy
    @no_cognitive_symptomatology.destroy
    respond_to do |format|
      format.html { redirect_to no_cognitive_symptomatologies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_no_cognitive_symptomatology
      @no_cognitive_symptomatology = @consultation.no_cognitive_symptomatology
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def no_cognitive_symptomatology_params
      params.require(:no_cognitive_symptomatology).permit(:psychomotor, :lability, :euphoria, :apathy, :depression, :anxiety, :hallucinations, :delusions, :disinhibition, :motor, :sleep)
    end
end
