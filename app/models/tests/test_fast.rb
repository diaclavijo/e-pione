class TestFast < ActiveRecord::Base

  validates :f1, presence: true

  NAME = 'Test de Fast'

  OPTIONS = { '1 - SIN DETERIORO COGNOSCITIVO'         => 1,
              '2 - DETERIORO COGNOSCITIVO MUY LEVE'     => 2,
              '3 - DETERIORO COGNOSCITIVO LEVE' => 3,
              '4 - DÉFICIT COGNOSCITIVO MODERADO'    => 4,
              '5 - DÉFICIT COGNOSCITIVO GRAVE'        => 5,
              '6 - DÉFICIT COGNOSCITIVO MODERADAMENTE GRAVE'    => 6,
              '7 - DÉFICIT COGNOSCITIVO MUY GRAVE'        => 7   }


  def score
    ( self.f1 )
  end

  include IsTest
  include IsExploracionFuncional
end
