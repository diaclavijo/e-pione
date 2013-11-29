class NoCognitiveSymptomatology < ActiveRecord::Base

  validates :psychomotor, :lability, :euphoria, :apathy, :depression, :anxiety, :hallucinations, :delusions, :disinhibition, :motor, :sleep, presence: true

  include IsExamination

end
