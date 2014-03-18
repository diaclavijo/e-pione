class TestReloj < ActiveRecord::Base

	with_options unless: 'score' do |without_score|
		without_score.validates :f1, :f2, :f3, :f4, presence: true, inclusion: { in: 0..3 , message: 'Not in the range'}
	end
  CATEGORY = 0

  OPTIONSA = { 'Correcto' =>   3 ,
               'Error' =>   0
  }

  OPTIONSB = { 'Correcto' =>   2 ,
               'Error' =>   0
  }

	REDIRECT_TO_AFTER_CREATION = :additional_tests

  NAME = 'Test del reloj'


  include IsTest

	private

		def calc_score
			( self.f1 + self.f2 + self.f3 + self.f4  )
		end
end
