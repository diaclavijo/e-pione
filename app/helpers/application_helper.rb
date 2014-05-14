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

    def password_field(method, options = {})

      options[:class] ='form-control'
      @template.content_tag(
          :div,
          super(method,options),
          class: 'col-md-3'
      )

    end

    def email_field(method, options = {})

      options[:class] ='form-control'
      @template.content_tag(
          :div,
          super(method,options),
          class: 'col-md-3'
      )

    end



    def text_area(method, options = {})
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
        class: 'col-md-1'
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
      html_options[:disabled] = @options[:disabled]

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
          class: 'col-md-4 col-md-offset-2'
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
          class: 'col-md-offset-6 col-md-2'
          )
    end

  end
  def flash_class(level)
    case level
      when :notice then "alert alert-success alert-dismissable col-md-6 col-md-offset-3 lead text-center"
      when :success then "alert alert-success alert-dismissable col-md-6 col-md-offset-3 lead text-center"
      when :error then "alert alert-warning alert-dismissable col-md-6 col-md-offset-3"
      when :alert then "alert alert-danger alert-dismissable col-md-6 col-md-offset-3 lead text-center"
    end
  end

  # Dado el valor que devuelve Time.now.wday , devuelve el día de la semana en español
  def dia_semana(dia)
    case dia
      when 0
        'Domingo'
      when 1
        'Lunes'
      when 2
        'Martes'
      when 3
        'Miércoles'
      when 4
        'Jueves'
      when 5
        'Viernes'
      when 6
        'Sábado'
    end
  end


  # Dado el valor que devuelve Time.now.wday , devuelve el día de la semana en español
  def dia_mes(mes)
    case mes
      when 1
        'Enero'
      when 2
        'Febrero'
      when 3
        'Marzo'
      when 4
        'Abril'
      when 5
        'Mayo'
      when 6
        'Junio'
      when 7
        'Julio'
      when 8
        'Agosto'
      when 9
        'Septiembre'
      when 10
        'Octubre'
      when 11
        'Noviembre'
      when 12
        'Diciembre'
    end
  end

  def fecha_actual()
    t = Time.now
    dia_semana(t.wday)+', '+t.day.to_s+' de '+dia_mes(t.month)+ ' de '+t.year.to_s
  end

end
