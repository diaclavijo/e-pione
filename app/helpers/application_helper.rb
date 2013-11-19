module ApplicationHelper

  class MyFormBuilder < ActionView::Helpers::FormBuilder

    def text_field(method, options = {})
      options[:class] ='form-control'
      @template.content_tag(
          :div,
          super(method,options),
          class: 'col-md-4'
      )

    end

    def number_field(method, options = {})
      options[:class] ='form-control'
      @template.content_tag(
        :div,
        super(method,options),
        class: 'col-md-4'
      )
    end



    def date_select(method, options = {}, html_options = {})
      options[:class] ='form-control'
      @template.content_tag(
          :div,
          super(method,options,html_options),
          class: 'col-md-4'
      )

    end
    def select(method, choices, options = {}, html_options = {})
      html_options[:class] = 'form-control'
      options[:include_blank] = 'Seleccionar...'
      @template.content_tag(
          :div,
          super(method, choices, options, html_options),
          class: 'col-md-4'
      )

    end

    def label(method, text = nil, options = {}, &block)
      @template.content_tag(
          :div,
          super(method, text, options, &block),
          class: 'col-md-6'
      )
    end


    def button(value = nil, options = {}, &block)
      options[:class] = 'btn btn-default'
      @template.content_tag(
          :div,
          super(value, options, &block),
          class: 'col-md-offset-4 col-md-10'
      )
    end

    def submit(value=nil, options={})
      options[:class] = 'btn btn-info'
      @template.content_tag(
          :div,
          super(value, options),
          class: 'col-md-offset-4 col-md-10'
          )
    end

  end
  def flash_class(level)
    case level
      when :notice then "alert alert-info alert-dismissable col-md-6 col-md-offset-3 lead text-center"
      when :success then "alert alert-success alert-dismissable col-md-6 col-md-offset-3 lead text-center"
      when :error then "alert alert-warning alert-dismissable col-md-6 col-md-offset-3"
      when :alert then "alert alert-danger alert-dismissable col-md-6 col-md-offset-3 lead text-center"
    end
  end

end
