class TestYesavage4 < ActiveRecord::Base


  validates :first, :second, :third, :forth, presence: true, inclusion: { in: 0..1 , message: 'Not in the range'}

  CATEGORY = 1

  def score
    ( self.first + self.second + self.third + self.forth)
  end


  include IsTest

end
