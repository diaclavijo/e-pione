module IsExploracionFuncional
  extend ActiveSupport::Concern

  included do
    CATEGORY = 2
    REDIRECT_TO_AFTER_CREATION = :exploracion_funcional
    FATHER_BREADCRUMBS = :consultation_exploracion_funcional
  end

end