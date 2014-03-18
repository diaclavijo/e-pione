class TestMinimental < ActiveRecord::Base
	with_options unless: 'score' do |without_score|
  	without_score.validates :f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :f11, :f12, :f13, :f14, :f15, :f16, :f17, :f18, :f19, presence: true
	end
  NAME = 'Test minimental'

	SUCCESS = { 'Error' => 0, 'Acierto' => 1 }

	REDIRECT_TO_AFTER_CREATION = :additional_tests

  include IsTest

	private
		def calc_score
			( self.f1 +
					self.f2 +
					self.f3 +
					self.f4 +
					self.f5 +
					self.f6 +
					self.f7 +
					self.f8 +
					self.f9 + self.f10 + self.f11 +  self.f12 +  self.f13 +  self.f14 +
					self.f15 + self.f16 + self.f17 + self.f18 + self.f19 )
		end
end
