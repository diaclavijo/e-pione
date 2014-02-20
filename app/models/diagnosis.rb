class Diagnosis < ActiveRecord::Base
  validates :diagnosis, presence: true
  validates :consultation_id, presence: true
  validates :diagnosis, inclusion: {in: 0..1}

  belongs_to :consultation

  def diagnosis_text
    INT_TO_DIAGNOSIS[self.diagnosis]
  end



  private
    INT_TO_DIAGNOSIS = {
       0 => 'Sano',
       1 => 'DCL'
    }
end
