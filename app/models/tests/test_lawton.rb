class TestLawton < ActiveRecord::Base

  validates :f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, presence: true

  NAME = 'Test de LAWTON/BRODY'

  OPTIONS1 = { 
  'Utiliza el teléfono por iniciativa propia' => 1,
  'Es capaz de marcar bien algunos números familiares' => 1,
  'Es capaz de contestar al teléfono pero no de marcar' => 1,
  'No es capaz de usar el teléfono' => 0
  }

  OPTIONS2 = { 
  'Realiza todas las compras necesarias independientemente' => 1,
  'Realiza independientemente pequeñas compras' => 0             ,
  'Necesita ir acompañado para hacer cualquier compra' => 0       ,
  'Totalmente incapaz de comprar' => 0
  }

  OPTIONS3 = { 
  'Organiza, prepara y sirve las comidas por sí solo adecuadamente' => 1,
  'Prepara adecuadamente las comidas si se le proporcionan los ingredientes' => 0,
  'Prepara, calienta y sirve las comidas pero no sigue una dieta adecuada  ' => 0 ,
  'Necesita que le preparen y sirvan las comidas' => 0
  }

  OPTIONS4 = { 
  'Mantiene la casa solo o con ayuda ocasional (para trabajos pesados)' => 1       ,
  'Realiza tareas ligeras como lavar los platos o hacer las camas' => 1             ,
  'Realiza tareas ligeras pero no puede mantener un adecuado nivel de limpieza' => 1 ,
  'Necesita ayuda en todas las labores de la casa' => 1,
  'No participa en ninguna labor de la casa' => 0
  }

  OPTIONS5 = { 
  'Lava por sí solo toda su ropa' => 1                                                 ,
  'Lava por sí solo pequeñas prendas' => 1                                            ,
  'Todo el lavado de ropa debe ser realizado por otro' => 0
  }

  OPTIONS6 = { 
  'Viaja solo en transporte público o conduce su propio coche' => 1                     ,
  'Es capaz de coger un taxi pero no usa otro medio de transporte' => 1                  ,
  'Viaja en transporte público cuando va acompañado por otra persona' => 1                ,
  'Sólo utiliza el taxi o el automóvil con ayuda de otros' => 1                            ,
  'No viaja' => 0

  }

  OPTIONS7 = { 
  'Es capaz de tomar su medicación a la hora y con la dosis correcta' => 1                  ,
  'Toma su medicación si la dosis le es preparada previamente' => 0                          ,
  'No es capaz de administrarse su medicación' => 0
  }

  OPTIONS8 = { 
  'Se encarga de sus asuntos económicos por sí solo' => 1                                     ,
  'Realiza las compras de cada día pero necesita ayuda en las grandes compras, bancos, etc.' => 1,
  'Incapaz de manejar dinero' => 0
  }



  def score
    ( self.f1 + self.f2 + self.f3 + self.f4 + self.f5 + self.f6 + self.f6 + self.f7 + self.f8 )
  end

  include IsTest
  include IsExploracionFuncional
end
