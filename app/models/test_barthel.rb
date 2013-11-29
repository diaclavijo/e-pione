class TestBarthel < ActiveRecord::Base

  validates :f1, :f2, :f3, :f4, presence: true

  CATEGORY = 2


  def score
    ( self.f1 + self.f2 + self.f3 + self.f4 )
  end

  include IsTest

end
