class Patient < ActiveRecord::Base

  has_many :consultations, dependent: :destroy
  belongs_to :physician
  has_many :tests, through: :consultations
  has_many :diagnoses, through: :consultations

  attr_accessor :education_select

  # Validations
  validates :education_select, presence: true
  validates :name, :surname, :birth, :education, presence: true
  validates :id2, uniqueness: true, allow_nil: true
  validates :id2, numericality: { only_integer: true }, allow_nil:  true
  validates :education, inclusion: {in: 0..20 }
  validates :gender, inclusion: {in: 0..2 }, allow_nil: true


  def education_select
    return nil if self.education.nil?
    EDUCATIONS.values.include?(self.education) ? self.education : -1
  end

  # Configuration
  paginates_per 5

  #nilify_blanks  # for avoid storing empty strings in database , instead is null
  EDUCATIONS = {
                 'Analfabeto             (0 años)'  => 0 ,
                 'Estudios mínimos        (6 años)'  => 6 ,
                 'Estudios Primarios      (10 años)' => 10 ,
                 'Estudios Secundarios    (12 años)' => 12,
                 'Estudios Universitarios (16 años)' => 16,
                 'Otro (introducir número de años)'  => -1 }

  GENDERS = {'Desconocido' => 0, 'Hombre' => 1, 'Mujer' => 2  }

  def education_text
    EDUCATIONS.key(self[:education]) || self[:education]
  end

  def gender_text
    GENDERS.key self[:gender]
  end

  def age
    today = Date.today
    ( ( ( today - self.birth) / 365.25 ).to_f ).to_i
  end
  # Methods
  def self.search(search, search_type)
    wildcard_search = "%#{search}%"

    case search_type
      when '0'
        where("name LIKE :search OR surname LIKE :search", search: wildcard_search)
      when '1'
        where("name LIKE :search", search: wildcard_search)
      when '2'
        where("surname LIKE :search", search: wildcard_search)
    end
  end

  def full_name
    self[:name]+' '+self[:surname]
  end

end
