class Consultation < ActiveRecord::Base
  belongs_to :patient
  belongs_to :physician

  has_many :tests, dependent: :destroy # super index for listing differente resources
  has_many :examinations, dependent: :destroy # super index for listing different resources

  has_one :cognitive_symptomatology, dependent: :destroy
  has_many :test_minimentals, dependent: :destroy

  has_many :test_iqcodes, dependent: :destroy
  has_many :test_mecs, dependent: :destroy
  has_one :no_cognitive_symptomatology, dependent: :destroy
  has_many :test_yesavage4s, dependent: :destroy
  has_many :test_yesavage10s, dependent: :destroy
  has_many :test_yesavage15s, dependent: :destroy
  has_many :test_yesavage30s, dependent: :destroy
  has_many :test_npis, dependent: :destroy
  has_many :test_pfeiffers, dependent: :destroy
  has_many :test_relojs, dependent: :destroy

  #exploracion funcional tests
  has_many :test_barthels, dependent: :destroy
  has_many :test_fasts, dependent: :destroy
  has_many :test_katzs, dependent: :destroy
  has_many :test_lawtons, dependent: :destroy

  has_one :neurological_examination, dependent: :destroy

  has_one :physical_examination, dependent: :destroy

  has_many :habitos, dependent: :destroy
  has_many :pathologies, dependent: :destroy
  has_many :pruebas, dependent: :destroy

  validates :activity, presence: true # example for prohibiting it to be saved at least is presented the value
  validates :patient, presence: true
  validates :physician, presence: true

  ACTIVITY = { 'Atención especializada' => 0, 'Atención primaria' => 1, 'Otras atenciones sociosanitarias' => 2}

  def activity_text
    ACTIVITY.key self[:activity]
  end


  def cognitive_tests( page= 0 )
    self.tests.where(category: 0).page page
  end

  def no_cognitive_tests( page= 0 )
    self.tests.where(category: 1).page page
  end

  def exploracion_funcional_tests( page= 0 )
    self.tests.where(category: 2).page page
  end

end

