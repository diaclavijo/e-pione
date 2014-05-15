class Fototest
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming


  attr_accessor :cadena, :edad, :total_hombres_set, :total_mujeres_set

  validates :total_hombres_set, :total_mujeres_set, :cadena, :edad, :education, :education_select, presence: true
  validates :education, inclusion: {in: 0..20 }

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  # EDUCATION . Consider refactoring. This code is duplicated in New Diagnosis
  attr_accessor :education_select, :education
  def education_select
    return nil if self.education.blank?
    self.education = self.education.to_i unless self.education.is_a?(Integer)
    Patient::EDUCATIONS.values.include?(self.education) ? self.education : -1
  end
  def education_text
    Patient::EDUCATIONS.key(self[:education]) || self[:education]
  end

  def cartas1;   self.cadena[0].to_i; end;
  def coche1;   self.cadena[1].to_i; end;
  def pera1;   self.cadena[2].to_i; end;
  def trompeta1;   self.cadena[3].to_i; end;
  def zapatos1;   self.cadena[4].to_i; end;
  def cuchara1;   self.cadena[5].to_i; end;
  def cartas2;   self.cadena[6].to_i; end;
  def coche2;   self.cadena[7].to_i; end;
  def pera2;   self.cadena[8].to_i; end;
  def trompeta2;   self.cadena[9].to_i; end;
  def zapatos2;   self.cadena[10].to_i; end;
  def cuchara2;   self.cadena[11].to_i; end;
  def cartas3;   self.cadena[12].to_i; end;
  def coche3;   self.cadena[13].to_i; end;
  def pera3;   self.cadena[14].to_i; end;
  def trompeta3;   self.cadena[15].to_i; end;
  def zapatos3;   self.cadena[16].to_i; end;
  def cuchara3;   self.cadena[17].to_i; end;
  def totalHombres;   self.cadena[18..19].to_i; end;
  def totalMujeres;   self.cadena[20..21].to_i; end;

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

end
