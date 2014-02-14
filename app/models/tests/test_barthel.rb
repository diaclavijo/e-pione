class TestBarthel < ActiveRecord::Base

  validates :f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, presence: true

  validates :f1, :f3, :f5, :f6, :f7, :f10, inclusion: { in: [10, 5, 0] }
  validates :f8, :f9, inclusion: { in: [5, 0] }
  validates :f2, :f4, inclusion: { in: [5, 0] }

  NAME = 'Test de Barthel'

  def score
    ( self.f1 + self.f2 + self.f3 + self.f4 + self.f5 + self.f6 + self.f7 + self.f8 + self.f9 + self.f10 )
  end

  include IsTest
  include IsExploracionFuncional
end
