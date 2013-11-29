class NeurologicalExamination < ActiveRecord::Base

  
  validates :f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :f11, :f12, :f13, :f14, :f15, :f16, :f17, :f18, :f19, :f20, :f21, :f22, :f23, :f24, :f25, :f26, :f27, :f28, :f29, :f30, :f31, :f32, :f33, :f34, :f35, :f36, :f37, presence: true


  NEUROPTIONS = { 'Normal'        =>   0 ,
                  'Izquierdo'     =>   1 ,
                  'Derecho'       =>   2 ,
                  'Bilateral'     =>   3  }

  include IsExamination

end
