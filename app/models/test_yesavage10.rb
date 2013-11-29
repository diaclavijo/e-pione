class TestYesavage10 < ActiveRecord::Base



  validates :f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, presence: true, inclusion: { in: 0..1 , message: 'Not in the range'}

  CATEGORY = 1

  def score
    ( self.f1 + self.f2 + self.f3 + self.f4 + self.f5 + self.f6 + self.f7 + self.f8 + self.f9 + self.f10 )
  end

  include IsTest


end
