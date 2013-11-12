class Consultation < ActiveRecord::Base
  belongs_to :patient
  belongs_to :physician
  has_one :cognitive_symptomatology

  validates :activity, presence: true # example for prohibiting it to be saved at least is presented the value


  validates :patient, presence: true
  validates :physician, presence: true



  ACTIVITY = { 'Atención especializada' => 0, 'Atención primaria' => 1, 'Otras atenciones sociosanitarias' => 2}

  def activity_text
    ACTIVITY.key self[:activity]
  end

end

