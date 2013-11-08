class CognitiveSymptomatologiesController < ApplicationController
  before_action :set_cognitive_symptomatology, only: [:show, :edit, :update, :destroy]

  # GET /cognitive_symptomatologies
  # GET /cognitive_symptomatologies.json
  def index
    @cognitive_symptomatologies = CognitiveSymptomatology.all
  end

  # GET /cognitive_symptomatologies/1
  # GET /cognitive_symptomatologies/1.json
  def show
  end

  # GET /cognitive_symptomatologies/new
  def new
    @cognitive_symptomatology = CognitiveSymptomatology.new
    @consultation = Consultation.find(params[:consultation_id])
  end

  # GET /cognitive_symptomatologies/1/edit
  def edit
  end

  # POST /cognitive_symptomatologies
  # POST /cognitive_symptomatologies.json
  def create
    @cognitive_symptomatology = CognitiveSymptomatology.new(cognitive_symptomatology_params)

    respond_to do |format|
      if @cognitive_symptomatology.save
        format.html { redirect_to @cognitive_symptomatology, notice: 'Cognitive symptomatology was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cognitive_symptomatology }
      else
        format.html { render action: 'new' }
        format.json { render json: @cognitive_symptomatology.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cognitive_symptomatologies/1
  # PATCH/PUT /cognitive_symptomatologies/1.json
  def update
    respond_to do |format|
      if @cognitive_symptomatology.update(cognitive_symptomatology_params)
        format.html { redirect_to @cognitive_symptomatology, notice: 'Cognitive symptomatology was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
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
      @cognitive_symptomatology = CognitiveSymptomatology.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cognitive_symptomatology_params
      params.require(:cognitive_symptomatology).permit(:Consultation_id, :memory, :disorientation, :aphasia, :apraxia, :agnosia, :executive, :reasoning, :spatial)
    end
end
