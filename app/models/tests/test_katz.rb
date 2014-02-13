class TestKatz < ActiveRecord::Base

  validates :f1, presence: true
  validates :f1, inclusion: { in: 0..7}

  NAME = 'Test de Katz'

  OPTIONS = { 'A - Independiente en alimentación/continencia/movilidad/uso del inodoro/vestirse y bañarse'         => 0,
              'B - Independiente para todas las funciones anteriores excepto una'     => 1,
              'C - Independiente para todas excepto bañarse y otra función adicional' => 2,
              'D - Independiente para todas excepto bañarse/vestirse y otra función adicional'    => 3,
              'E - Independiente para todas excepto bañarse/vestirse/uso del inodoro y otra función adicional'        => 4,
              'F - Independiente para todas excepto bañarse/ vestirse/uso del inodoro y otra función adicional'    => 5,
              'G - Dependiente en las seis funciones'        => 6,
              'H - Dependiente en al menos dos funciones pero no clasificable como C/D/E/F' => 7}

  OPTIONS_NUMBERS_LETTERS = {
      0 => 'A',
      1 => 'B',
      2 => 'C',
      3 => 'D',
      4 => 'E',
      5 => 'F',
      6 => 'G',
      7 => 'H'
  }

  def score
    ( OPTIONS_NUMBERS_LETTERS[self.f1] )
  end

  include IsTest
  include IsExploracionFuncional
end
