class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  layout :layout_by_resource



  class_attribute :resource_class, :resource_instance_name, :collection_name



  def initialize
    super

    initialize_resources_class_accessors!
    @var = 'hello'

  end

  protected

  def layout_by_resource
    if devise_controller? && resource_name == :physician   && action_name == 'new'
      "not_logged_in"
    else
      "application"
    end
  end

  # Initialize resources class accessors and set their default values.
  #
  def initialize_resources_class_accessors! #:nodoc:

    begin
      #Get the model class
      class_name = self.controller_name.classify
      self.resource_class = class_name.constantize
      self.resource_instance_name = self.controller_name.singularize.to_sym #test_name
      self.collection_name =  self.controller_name.to_sym
    rescue
      nil
    end


  end

  # Set resource ivar based on the current resource controller.
  def set_resource_ivar(resource) #:nodoc:
    instance_variable_set("@#{resource_instance_name}", resource)
  end

  # Get resource ivar based on the current resource controller.
  def get_resource_ivar #:nodoc:
    instance_variable_get("@#{resource_instance_name}")
  end

end
