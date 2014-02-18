class Diagnosis < ActiveRecord::Base
  validates :diagnosis, presence: true
  validates :consultation_id, presence: true

  belongs_to :consultation
end
