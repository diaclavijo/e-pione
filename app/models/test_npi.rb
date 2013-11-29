class TestNpi < ActiveRecord::Base

  validates :f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10,  :f11,  :f12,  :f13,  :f14,  :f15,  :f16,  :f17,  :f18,  :f19,  :f20,  :f21,  :f22,  :f23,  :f24,  :f25,  :f26,  :f27,  :f28,  :f29,  :f30, :f31, :f32, :f33, :f34, :f35, :f36, presence: true, inclusion: { in: 0..5 , message: 'Not in the range'}
                #  ATTENTION - YOU HAVE TO COMPLETE THE TEST NPI , AARON HAS TO TELL YOU HOW TO CALCULATE THE PUNTUACTION , CONTROLLER AND VIEWS


  OPTIONSA = { 'No presente' =>   0 ,
                 'Menos de una vez por semana' =>   1 ,
                 'Aprox. 1 vez por semana'        =>   2 ,
                 'Varias veces por semana'=>   3 ,
                 'A diario o continuamente'  =>   4
              }


  OPTIONSB = { 'Leve' =>   0 ,
               'Moderado' =>   1 ,
               'Grave'        =>   2
          }

  OPTIONSC = { 'No provoca' =>   0 ,
               'Mínimo' =>   1 ,
               'Leve'        =>   2  ,
               'Moderado'        =>   3  ,
               'Moderado-grave'        =>   4  ,
               'Muy grave o extremo'        =>   5
              }

  CATEGORY = 0


  def score
    ( self.f1 + self.f2 + self.f3 + self.f4 + self.f5 + self.f6 + self.f7 + self.f8 + self.f9 + self.f10 + self.f11 + self.f12 + self.f13 + self.f14 + self.f15 + self.f16 + self.f17 + self.f18 + self.f19 + self.f20 + self.f21 + self.f22 + self.f23 + self.f24 + self.f25 + self.f26 + self.f27 + self.f28 + self.f29 + self.f30 + self.f31 + self.f32 + self.f33 + self.f34 + self.f35 + self.f36 )
  end

  include IsTest

end
