class ComputerDiagnosis < Diagnosis
	attr_accessor :education_select


  validates :probability, presence: true, unless: 'siad_params_validation'
  validates :faq_score, :mmse_score, :education, :age, :education_select, presence: true

	validates :education, inclusion: {in: 0..20 }
	validates :mmse_score, :faq_score, inclusion: {in: 0..30 }

	def valid_siad_exec?
		self.siad_params_validation = true
		aux = valid?
		self.siad_params_validation = nil
		aux
	end

	def education_select
		return nil if self.education.nil?
		Patient::EDUCATIONS.values.include?(self.education) ? self.education : -1
	end

	def education_text
		Patient::EDUCATIONS.key(self[:education]) || self[:education]
	end


end
