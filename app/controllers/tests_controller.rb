class TestsController < ConsultationResourcesController
  before_action :set_test_iqcode, only: [:show, :edit, :update, :destroy]

  def show
  end

  # GET /consultations/1/#{test_name}/new
  def new
    set_resource_ivar(
        @consultation.send(
            collection_name
        ).build # @test_iqcode = @consultation.test_iqcodes.build
    )
  end


  # POST /consultation/1/#{test_name}s
  def create

    set_resource_ivar(
        @consultation.send(
            collection_name
        ).build send("#{resource_instance_name}_params")
    )
    # @test_iqcode = @consultation.test_iqcodes.build test_iqcode_params

    respond_to do |format|
      if get_resource_ivar.save
        format.html { redirect_to [@consultation, resource_class::REDIRECT_TO_AFTER_CREATION], notice: t('tests.created') }
      else
        format.html { render action: 'new' }
      end
    end
  end


end
