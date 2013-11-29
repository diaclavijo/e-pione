module IsCognitiveSymptomatology
  extend ActiveSupport::Concern

  included do
    CATEGORY = 0
    REDIRECT_TO_AFTER_CREATION = :cognitive_symptomatology
  end

end