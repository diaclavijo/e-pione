class TestsController < ConsultationResourcesController

  def show
  end

  # GET /consultations/1/#{test_name}/new
  def new
    session[:redirect_to] = params[:redirect_to]
    set_resource_ivar(
        @consultation.send(
            collection_name
        ).build # @test_iqcode = @consultation.test_iqcodes.build
    )
    render 'tests/new'
  end


  # POST /consultation/1/#{test_name}s
  def create
    redirection = session[:redirect_to] || [@consultation.patient, @consultation]
    set_resource_ivar(
        @consultation.send(
            collection_name
        ).build send("#{resource_instance_name}_params")
    )
    # @test_iqcode = @consultation.test_iqcodes.build test_iqcode_params

    respond_to do |format|
      if get_resource_ivar.save
        session.delete(:redirect_to)
        format.html { redirect_to redirection, notice: t('tests.created') }
      else
        format.html { render action: 'new' }
      end
    end
  end


  # DELETE /test_iqcodes/1
  # DELETE /test_iqcodes/1.json
  def destroy
    # TODO - It has to be required the physician to be the one who made the test
    get_resource_ivar.destroy

    respond_to do |format|
      format.html { redirect_to [@consultation.patient, @consultation], notice: t('tests.deleted')  }
    end
  end


end
