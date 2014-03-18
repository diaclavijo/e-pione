class QuickTestsController < ApplicationControllerSigned

  # GET /#{test_name}/new
  def new
    set_resource_ivar(
        resource_class.new # @test_faq = test_faqs.new
    )
    render 'quick_tests/new'
  end


  # POST /#{test_name}s
  def create

    set_resource_ivar(
        resource_class.new send("#{resource_name.underscore}_params")
    )
    # @test_faq = test_faqs.new test_iqcode_params

    respond_to do |format|
      if get_resource_ivar.valid?
				session[:"#{resource_name.underscore.split('_').last}_score"] =  get_resource_ivar.get_score
        format.html { redirect_to new_quick_diagnosis_path, notice: t('tests.created') }
      else
        format.html { render action: 'new' }
      end
    end
  end


	private

	def initialize_resources_class_accessors! #:nodoc:

		# Otherwise use the Group class, or fail
		self.resource_class ||= begin
			class_name = self.controller_name.classify
			class_name.gsub!('Quick','')
			class_name.constantize
		rescue NameError => e
			raise unless e.message.include?(class_name)
			nil
		end

		self.resource_name = resource_class.to_s

		self.resource_instance_name = self.controller_name.singularize.to_sym #test_name

		self.collection_name =  self.controller_name.to_sym




	end
end
