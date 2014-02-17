class ComputerDiagnosis < Diagnosis
  validates :probability, presence: true
end
