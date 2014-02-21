class TestFaq < ActiveRecord::Base
  validates :f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, presence: true
  validates :f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, inclusion: { in: 0..5 }

  OPTIONS = {
      'Normal' => 0 ,
      'Nunca lo ha hecho, pero podría hacerlo ahora' => 1 ,
      'Nunca lo ha hecho y tendría dificultades ahora' => 2,
      'Tiene dificultades, pero lo hace por sí mismo' => 3,
      'Requiere asistencia' => 4,
      'Dependiente' => 5
  }

  NAME = 'Test FAQ'

  def score
    ( @@score_calc[self.f1] + @@score_calc[self.f2] + @@score_calc[self.f3] + @@score_calc[self.f4] + @@score_calc[self.f5] + @@score_calc[self.f6] + @@score_calc[self.f7] + @@score_calc[self.f8] + @@score_calc[self.f9] + @@score_calc[self.f10] )
  end

  include IsTest

  private
    @@score_calc = {
        0 => 0,
        1 => 0,
        2 => 1,
        3 => 1,
        4 => 2,
        5 => 3
    }

end
