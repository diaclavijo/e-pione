class TestYesavage4 < ActiveRecord::Base


  validates :f1, :f2, :f3, :f4, presence: true, inclusion: { in: 0..1 , message: 'Not in the range'}

  NAME = 'test Yesavage 4'

  def score
    ( self.f1 + self.f2 + self.f3 + self.f4)
  end


  include IsTest
  include IsNoCognitiveSymptomatology
end
