class TestLawton < ActiveRecord::Base

  validates :f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, presence: true
  validates :f1, inclusion: {in: 0..3}
  validates :f2, inclusion: {in: -2..1}
  validates :f3, inclusion: {in: -2..1}
  validates :f4, inclusion: {in: 0..4}
  validates :f5, inclusion: {in: 0..2}
  validates :f6, inclusion: {in: 0..4}
  validates :f7, inclusion: {in: -1..1}
  validates :f8, inclusion: {in: 0..2}

  NAME = 'Test de LAWTON/BRODY'

  OPTIONS1 = { 
  'Utiliza el teléfono por iniciativa propia' => 1,
  'Es capaz de marcar bien algunos números familiares' => 2,
  'Es capaz de contestar al teléfono pero no de marcar' => 3,
  'No es capaz de usar el teléfono' => 0
  }

  OPTIONS2 = { 
  'Realiza todas las compras necesarias independientemente' => 1,
  'Realiza independientemente pequeñas compras' => 0             ,
  'Necesita ir acompañado para hacer cualquier compra' => -1       ,
  'Totalmente incapaz de comprar' => -2
  }

  OPTIONS3 = { 
  'Organiza, prepara y sirve las comidas por sí solo adecuadamente' => 1,
  'Prepara adecuadamente las comidas si se le proporcionan los ingredientes' => 0,
  'Prepara, calienta y sirve las comidas pero no sigue una dieta adecuada  ' => -1 ,
  'Necesita que le preparen y sirvan las comidas' => -2
  }

  OPTIONS4 = { 
  'Mantiene la casa solo o con ayuda ocasional (para trabajos pesados)' => 1       ,
  'Realiza tareas ligeras como lavar los platos o hacer las camas' => 2             ,
  'Realiza tareas ligeras pero no puede mantener un adecuado nivel de limpieza' => 3 ,
  'Necesita ayuda en todas las labores de la casa' => 4,
  'No participa en ninguna labor de la casa' => 0
  }

  OPTIONS5 = { 
  'Lava por sí solo toda su ropa' => 1                                                 ,
  'Lava por sí solo pequeñas prendas' => 2                                            ,
  'Todo el lavado de ropa debe ser realizado por otro' => 0
  }

  OPTIONS6 = { 
  'Viaja solo en transporte público o conduce su propio coche' => 1                     ,
  'Es capaz de coger un taxi pero no usa otro medio de transporte' => 2                  ,
  'Viaja en transporte público cuando va acompañado por otra persona' => 3                ,
  'Sólo utiliza el taxi o el automóvil con ayuda de otros' => 4                            ,
  'No viaja' => 0
  }

  OPTIONS7 = { 
  'Es capaz de tomar su medicación a la hora y con la dosis correcta' => 1                  ,
  'Toma su medicación si la dosis le es preparada previamente' => 0                          ,
  'No es capaz de administrarse su medicación' => -1
  }

  OPTIONS8 = { 
  'Se encarga de sus asuntos económicos por sí solo' => 1                                     ,
  'Realiza las compras de cada día pero necesita ayuda en las grandes compras, bancos, etc.' => 2,
  'Incapaz de manejar dinero' => 0
  }

  def score
    ( calc_score(self.f1) + calc_score(self.f2) + calc_score(self.f3) + calc_score(self.f4) + calc_score(self.f5) + calc_score(self.f6) + calc_score(self.f7) + calc_score(self.f8) )
  end

  include IsTest
  include IsExploracionFuncional

  private
    def calc_score val
      val > 0 ? 1 : 0
    end
end
