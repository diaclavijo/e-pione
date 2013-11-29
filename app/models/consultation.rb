class Consultation < ActiveRecord::Base
  belongs_to :patient
  belongs_to :physician

  has_many :tests # super index for listing differente resources
  has_many :examinations # super index for listing different resources

  has_one :cognitive_symptomatology
  has_many :test_minimentals
  has_many :test_iqcodes
  has_many :test_mecs
  has_one :no_cognitive_symptomatology
  has_many :test_yesavage4s
  has_many :test_yesavage10s
  has_many :test_yesavage15s
  has_many :test_yesavage30s
  has_many :test_npis
  has_many :test_pfeiffers
  has_many :test_relojs

  #exploracion funcional tests
  has_many :test_barthels

  has_one :neurological_examination

  has_one :physical_examination





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

end

