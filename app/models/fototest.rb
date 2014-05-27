class Fototest < ActiveRecord::Base
  attr_accessor :siad_params_validation
  belongs_to :physician
  validates :physician_id, presence: true
  validates :age, :education, presence: true
  validates :cartas1, :coche1, :pera1, :trompeta1, :zapatos1, :cuchara1, :cartas2, :coche2, :pera2, :trompeta2, :zapatos2, :cuchara2, :cartas3, :coche3, :pera3, :trompeta3, :zapatos3, :cuchara3, presence: true
  validates :total_hombres, :total_mujeres, presence: true
  validates :gender, presence: true
  validates :education, inclusion: { in: 0..20 }
  validates :probability, :diagnosis, presence: true, unless: 'siad_params_validation'

  def deno
    cartas1 + coche1 + pera1 + trompeta1 + zapatos1 + cuchara1
  end

  def rl
    cartas2 + coche2 + pera2 + trompeta2 + zapatos2 + cuchara2
  end

  def rf
    cartas3 + coche3 + pera3 + trompeta3 + zapatos3 + cuchara3
  end

  def memoria
    rl + rf
  end

  def fluidez
    total_hombres + total_mujeres
  end

  def total
    deno + rl + rf + total_hombres + total_mujeres
  end

  # Code duplicated, consider refactoring
  def valid_siad_exec?
    self.siad_params_validation = true
    aux = valid?
    self.siad_params_validation = nil
    aux
  end

  def diagnosis_text
    INT_TO_DIAGNOSIS[self.diagnosis]
  end

  def sane?
    diagnosis == 0
  end

  def mci?
    diagnosis == 1
  end

  private

  INT_TO_DIAGNOSIS = {
      0 => 'sano',
      1 => 'con deterioro cognitivo'
  }
end
