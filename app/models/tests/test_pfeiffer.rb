class TestPfeiffer < ActiveRecord::Base

  EDUCACION = {'Bajo' => -1, 'Normal' => 0, 'Alto' => 1}

  FAILURE = { 'Error' => 1, 'Acierto' => 0}

  def score
    total = ( self.f1 + self.f2 + self.f3 + self.f4 + self.f5 + self.f6 + self.f7 + self.f8 + self.f9 + self.f10 + self.f11 )
    score = 'Normal' if (-1..2).include? total
    score = 'DCL' if (3..4).include? total
    score = 'Moderado DC' if (5..7).include? total
    score = 'Severo DC' if (8..11).include? total
    return score
  end # TODO - Score has to be calculated

  NAME = 'test de Pfeiffer'

  include IsTest
  include IsCognitiveSymptomatology

end