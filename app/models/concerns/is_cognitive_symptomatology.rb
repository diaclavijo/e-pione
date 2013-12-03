module IsCognitiveSymptomatology
  extend ActiveSupport::Concern

  included do
    CATEGORY = 0
    REDIRECT_TO_AFTER_CREATION = :cognitive_symptomatology # redirect to after creation and path in breadcrumbs
    FATHER_BREADCRUMBS = :consultation_cognitive_symptomatology
  end

end