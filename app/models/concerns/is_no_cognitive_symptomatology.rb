module IsNoCognitiveSymptomatology
  extend ActiveSupport::Concern

  included do
    CATEGORY = 1
    LINK_TO_AFTER_CREATION = :no_cognitive_symptomatology
  end

end