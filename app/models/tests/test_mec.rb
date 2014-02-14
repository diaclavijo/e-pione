class TestMec < ActiveRecord::Base
  validates :f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10,  :f11,  :f12,  :f13, presence: true, inclusion: { in: 0..5 , message: 'Not in the range'}

  def score
    ( self.f1 + self.f2 + self.f3 + self.f4 + self.f5 + self.f6 + self.f7 + self.f8 + self.f9 + self.f10 + self.f11 + self.f12 + self.f13 )
  end

  NAME = 'test MEC'

  include IsTest
  include IsCognitiveSymptomatology
end
