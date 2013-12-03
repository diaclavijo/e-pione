class TestKatz < ActiveRecord::Base

  validates :f1, presence: true

  NAME = 'Test de Katz'

  OPTIONS = { 'A - Independiente en alimentación/continencia/movilidad/uso del inodoro/vestirse y bañarse'         => 'A',
              'B - Independiente para todas las funciones anteriores excepto una'     => 'B',
              'C - Independiente para todas excepto bañarse y otra función adicional' => 'C',
              'D - Independiente para todas excepto bañarse/vestirse y otra función adicional'    => 'D',
              'E - Independiente para todas excepto bañarse/vestirse/uso del inodoro y otra función adicional'        => 'E',
              'F - Independiente para todas excepto bañarse/ vestirse/uso del inodoro y otra función adicional'    => 'F',
              'G - Dependiente en las seis funciones'        => 'G',
              'H - Dependiente en al menos dos funciones pero no clasificable como C/D/E/F' => 'H' }


  def score
    ( self.f1 )
  end

  include IsTest
  include IsExploracionFuncional
end
