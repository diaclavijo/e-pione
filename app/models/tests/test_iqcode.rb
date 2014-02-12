class TestIqcode < ActiveRecord::Base

  validates :f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :f11, :f12, :f13, :f14, :f15, :f16, :f17, presence: true, inclusion: { in: 0..5 , message: 'Not in the range'}

  OPTIONS = { 'Ha mejorado mucho'         => 1,
              'Ha mejorado levemente'     => 2,
              'Practicamente sin cambios' => 3,
              'Ha empeorado levemente'    => 4,
              'Gran empeoramiento'        => 5   }


  CATEGORY = 0
  NAME = 'test del informador'

  def score
    ( self.f1 + self.f2 + self.f3 + self.f4 +  self.f5 + self.f6 + self.f7 + self.f8 +  self.f9 + self.f10 + self.f11 +  self.f12 +  self.f13 +  self.f14 +  self.f15 + self.f16 )
  end


  include IsTest
  include IsCognitiveSymptomatology
end
