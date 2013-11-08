class Consultation < ActiveRecord::Base
  belongs_to :Patient
  belongs_to :Physician

  validates :activity, presence: true # example for prohibiting it to be saved at least is presented the value


  validates :Patient, presence: true
  validates :Physician, presence: true



  ACTIVITY = { 'Atención especializada' => 0, 'Atención primaria' => 1, 'Otras atenciones sociosanitarias' => 2}

  def activity
    ACTIVITY.key self[:activity]
  end

end

