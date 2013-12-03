module IsNoCognitiveSymptomatology
  extend ActiveSupport::Concern

  included do
    CATEGORY = 1
    REDIRECT_TO_AFTER_CREATION = :no_cognitive_symptomatology
    FATHER_BREADCRUMBS = :consultation_no_cognitive_symptomatology
  end

end