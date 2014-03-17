class TestFaq < ActiveRecord::Base
	with_options unless: 'score' do |without_score|
		without_score.validates :f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, presence: true
		without_score.validates :f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, inclusion: { in: 0..5 }
	end

  OPTIONS = {
      'Normal' => 0 ,
      'Nunca lo ha hecho, pero podría hacerlo ahora' => 1 ,
      'Nunca lo ha hecho y tendría dificultades ahora' => 2,
      'Tiene dificultades, pero lo hace por sí mismo' => 3,
      'Requiere asistencia' => 4,
      'Dependiente' => 5
  }

  NAME = 'Test FAQ'



  include IsTest

  private
    @@score_calc_table = {
        0 => 0,
        1 => 0,
        2 => 1,
        3 => 1,
        4 => 2,
        5 => 3
    }
	def calc_score
		( @@score_calc_table[self.f1] +
				@@score_calc_table[self.f2] +
				@@score_calc_table[self.f3] +
				@@score_calc_table[self.f4] +
				@@score_calc_table[self.f5] +
				@@score_calc_table[self.f6] +
				@@score_calc_table[self.f7] +
				@@score_calc_table[self.f8] +
				@@score_calc_table[self.f9] +
				@@score_calc_table[self.f10] )
	end

end
