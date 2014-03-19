class QuickDiagnosis < ActiveRecord::Base
	belongs_to :physician
  attr_accessor :education_select

  # Validations
  validates :education_select, presence: true
  validates :education, :age, :mmse_score, :faq_score, presence: true
  validates :education, inclusion: {in: 0..20 }
  validates :mmse_score, :faq_score, inclusion: {in: 0..30 }


  def education_select
    return nil if self.education.nil?
    EDUCATIONS.values.include?(self.education) ? self.education : -1
  end

  #nilify_blanks  # for avoid storing empty strings in database , instead is null
  EDUCATIONS = {
      'Analfabeto             (0 años)'  => 0 ,
      'Estudios mínimos        (6 años)'  => 6 ,
      'Estudios Primarios      (10 años)' => 10 ,
      'Estudios Secundarios    (12 años)' => 12,
      'Estudios Universitarios (16 años)' => 16,
      'Otro (introducir número de años)'  => -1 }

	def sane?
		diagnosis == 0
	end

	def mci?
		diagnosis == 1
	end

  def education_text
    EDUCATIONS.key(self[:education]) || self[:education]
  end

  def diagnosis_text
    INT_TO_DIAGNOSIS[self.diagnosis]
  end

  private
  INT_TO_DIAGNOSIS = {
      0 => 'Sano',
      1 => 'Deterioro Cognitivo'
  }
end
