class Examination < ActiveRecord::Base

  paginates_per 10

  belongs_to :consultation
  belongs_to :examination_data, polymorphic: true
  has_one :patient, through: :consultation
  has_one :physician, through: :consultation

  NOYESUNKNOWN = { 'No explorado' => 0, 'Desconocido' => 1, 'Sí' => 2, 'No' => 3}


end
