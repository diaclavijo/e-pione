class CognitiveSymptomatology < ActiveRecord::Base



  validates :memory, :disorientation, :aphasia, :apraxia, :agnosia, :executive, :reasoning, :spatial, presence: true


  include IsExamination

end
