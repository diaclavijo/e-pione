class Consultation < ActiveRecord::Base
  belongs_to :patient
  belongs_to :physician

  has_many :tests, dependent: :destroy # super index for listing differente resources

  has_many :test_minimentals, dependent: :destroy
  has_many :test_relojs, dependent: :destroy
  has_many :test_faqs, dependent: :destroy
  has_many :diagnoses, dependent: :destroy
  has_many :human_diagnoses
  has_many :computer_diagnoses

  validates :activity, presence: true # example for prohibiting it to be saved at least is presented the value
  validates :patient, presence: true
  validates :physician, presence: true

  ACTIVITY = { 'Atención especializada' => 0, 'Atención primaria' => 1, 'Otras atenciones sociosanitarias' => 2}

  def activity_text
    ACTIVITY.key self[:activity]
  end

end

