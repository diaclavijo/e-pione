class Habito < ActiveRecord::Base
  validates :habito, :comentario, presence: true
  validates :consultation_id, presence: true

  belongs_to :consultation
  has_one :physician, through: :consultation
  has_one :patient, through: :consultation


  HABITOS=       { 'Tabaco'         => 1,
                  'Alcohol'     => 2,
                  'Drogas' => 3 }

  def habito_text
    HABITOS.key self.habito
  end

end
