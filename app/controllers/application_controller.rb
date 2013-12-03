class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  layout :layout_by_resource



  class_attribute :resource_class, :resource_instance_name, :collection_name
  helper_method :resource_class, :resource_instance_name,  :collection_name, :get_resource_ivar


  def initialize
    super
    initialize_resources_class_accessors!
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


     # First priority is the namespaced model, e.g. User::Group
     self.resource_class ||= begin
       namespaced_class = self.name.sub(/Controller/, '').singularize
       namespaced_class.constantize
     rescue NameError
       nil
     end



     # Second priority is the top namespace model, e.g. EngineName::Article for EngineName::Admin::ArticlesController
     self.resource_class ||= begin
       namespaced_classes = self.name.sub(/Controller/, '').split('::')
       namespaced_class = [namespaced_classes.first, namespaced_classes.last].join('::').singularize
       namespaced_class.constantize
     rescue NameError
       nil
     end



     # Third priority the camelcased c, i.e. UserGroup
     self.resource_class ||= begin
       camelcased_class = self.name.sub(/Controller/, '').gsub('::', '').singularize
       camelcased_class.constantize
     rescue NameError
       nil
     end



     # Otherwise use the Group class, or fail
     self.resource_class ||= begin
       class_name = self.controller_name.classify
       class_name.constantize
     rescue NameError => e
       raise unless e.message.include?(class_name)
       nil
     end



      self.resource_instance_name = self.controller_name.singularize.to_sym #test_name

      self.collection_name =  self.controller_name.to_sym




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
