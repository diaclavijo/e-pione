class TestIqcode < ActiveRecord::Base

  validates :first, :second, :third, :forth,  :sixth, :seventh, :eighth, :ninth,  :tenth, :eleventh, :twelfth,  :thirteenth,  :fourteenth,  :fifteenth,  :sixteenth, :seventeenth, presence: true, inclusion: { in: 0..5 , message: 'Not in the range'}

  OPTIONS = { 'Ha mejorado mucho'         => 1,
              'Ha mejorado levemente'     => 2,
              'Practicamente sin cambios' => 3,
              'Ha empeorado levemente'    => 4,
              'Gran empeoramiento'        => 5   }


  CATEGORY = 0

  def score
    ( self.first + self.second + self.third + self.forth +  self.fifth + self.sixth + self.seventh + self.eighth +  self.ninth + self.tenth + self.eleventh +  self.twelfth +  self.fourteenth +  self.fifteenth +  self.sixteenth + self.seventeenth )
  end


  include IsTest
  include IsCognitiveSymptomatology
end
