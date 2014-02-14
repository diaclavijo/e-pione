class Patient < ActiveRecord::Base

  has_many :consultations
  belongs_to :physician
  has_many :tests, through: :consultations

  # Validations
  validates :name, :surname, :birth, presence: true
  validates :id2, uniqueness: true, allow_nil: true
  validates :id2, numericality: { only_integer: true }, allow_nil:  true
  validates :education, inclusion: {in: 0..6}
  validates :gender, inclusion: {in: 0..2}

  # Configuration
  paginates_per 10

  #nilify_blanks  # for avoid storing empty strings in database , instead is null
  EDUCATIONS = { 'Desconocido' => 0, 'Analfabeto' => 1, 'Lee y escribe' => 2, 'Estudios mínimos' => 3 , 'Estudios Primarios' => 4 , 'Estudios Secundarios' => 5, 'Estudios Universitarios' => 6 }
  GENDERS = { 'Hombre' => 0, 'Mujer' => 1, 'Desconocido' => 2 }

  def education_text
    EDUCATIONS.key self[:education]
  end

  def gender_text
    GENDERS.key self[:gender]
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
