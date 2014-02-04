class Prueba < ActiveRecord::Base

  validates :prueba, presence: true
  validates :consultation_id, presence: true

  belongs_to :consultation
  has_one :physician, through: :consultation
  has_one :patient, through: :consultation

  PRUEBAS = {
      'Bioquímica' => 0,
      'Diagnóstico por imagen' => 1,
      'Hematología' => 2,
      'Resumen Val. Facultativa' => 3,
      'Serología y orina' => 4
  }

  def prueba_text
    PRUEBAS.key self.prueba
  end
end
