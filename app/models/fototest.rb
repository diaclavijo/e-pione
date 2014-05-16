class Fototest < ActiveRecord::Base
  attr_accessor :siad_params_validation
  belongs_to :physician
  validates :physician_id, presence: true
  validates :age, :education, :education_select, presence: true
  validates :cartas1, :coche1, :pera1, :trompeta1, :zapatos1, :cuchara1, :cartas2, :coche2, :pera2, :trompeta2, :zapatos2, :cuchara2, :cartas3, :coche3, :pera3, :trompeta3, :zapatos3, :cuchara3, presence: true
  validates :total_hombres, :total_mujeres, presence: true
  validates :education, inclusion: { in: 0..20 }
  validates :probability, :diagnosis, presence: true, unless: 'siad_params_validation'

  # EDUCATION . Consider refactoring. This code is duplicated in New Diagnosis
  attr_accessor :education_select
  def education_select
    return nil if self.education.blank?
    self.education = self.education.to_i unless self.education.is_a?(Integer)
    Patient::EDUCATIONS.values.include?(self.education) ? self.education : -1
  end
  def education_text
    Patient::EDUCATIONS.key(self[:education]) || self[:education]
  end

  def total1
    cartas1 + coche1 + pera1 + trompeta1 + zapatos1 + cuchara1
  end

  def total2
    cartas2 + coche2 + pera2 + trompeta2 + zapatos2 + cuchara2
  end

  def total3
    cartas3 + coche3 + pera3 + trompeta3 + zapatos3 + cuchara3
  end

  def total
    total1 + total2 + total3 + totalHombres + totalMujeres
  end



  # Code duplicated, consider refactoring
  def valid_siad_exec?
    self.siad_params_validation = true
    aux = valid?
    self.siad_params_validation = nil
    aux
  end


end
