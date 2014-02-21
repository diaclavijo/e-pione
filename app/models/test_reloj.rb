class TestReloj < ActiveRecord::Base

  validates :f1, :f2, :f3, :f4, presence: true, inclusion: { in: 0..3 , message: 'Not in the range'}

  CATEGORY = 0



  OPTIONSA = { 'Correcto' =>   3 ,
               'Error' =>   0

  }


  OPTIONSB = { 'Correcto' =>   2 ,
               'Error' =>   0
  }


  NAME = 'Test del reloj'

  def score
    ( self.f1 + self.f2 + self.f3 + self.f4  )
  end

  include IsTest
end
