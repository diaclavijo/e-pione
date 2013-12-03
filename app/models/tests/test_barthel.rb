class TestBarthel < ActiveRecord::Base

  validates :f1, :f2, :f3, :f4, presence: true

  NAME = 'Test de Barthel'


  def score
    ( self.f1 + self.f2 + self.f3 + self.f4 )
  end

  include IsTest
  include IsExploracionFuncional
end
