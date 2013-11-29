class PhysicalExamination < ActiveRecord::Base

  validates :talla, :peso, :tension, :f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :f11, :f12, :f13, :f14, presence: true
  validates :talla, :peso, numericality: true

  OPTIONS = { 'No explorado'        =>   0 ,
              'Normal'        =>   1 ,
                  'Alterado'     =>   2 ,
                  'Sí, presente'       =>   3 ,
                  'No, no existe'     =>   4  }


  include IsExamination
end
