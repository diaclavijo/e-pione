class Diagnosis < ActiveRecord::Base
	attr_accessor :siad_params_validation

  validates :diagnosis, presence: true, unless: 'siad_params_validation'
	validates :diagnosis, inclusion: {in: 0..1, allow_nil: true}

	validates :physician, presence: true

  belongs_to :consultation
	belongs_to :physician

  def diagnosis_text
    INT_TO_DIAGNOSIS[self.diagnosis]
  end

	def sane?
		diagnosis == 0
	end

	def mci?
		diagnosis == 1
	end


  private



    INT_TO_DIAGNOSIS = {
       0 => 'Sano',
       1 => 'Deterioro Cognitivo'
    }
end
