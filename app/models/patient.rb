class Patient < ActiveRecord::Base

  has_many :consultations
  belongs_to :physician
  has_many :tests, through: :consultations
  has_many :habitos, through: :consultations
  has_many :pathologies, through: :consultations
  has_many :pruebas, through: :consultations

  # Validations
  validates :name, :surname, :birth, presence: true
  validates :id2, uniqueness: true, allow_nil: true
  validates :id2, numericality: { only_integer: true }, allow_nil:  true

  # Configuration
  paginates_per 10

  #nilify_blanks  # for avoid storing empty strings in database , instead is null
  EDUCATIONS = { 'Desconocido' => 0, 'Analfabeto' => 1, 'Lee y escribe' => 2, 'Estudios mínimos' => 3 , 'Estudios Primarios' => 4 , 'Estudios Secundarios' => 5, 'Estudios Universitarios' => 6 }

  INSTITUTIONALIZEDS = { 'Desconocido' => 0, 'No' => 1, 'Hospital' => 2, 'Residencia' => 3 , 'Clínica' => 4, 'Otro' => 5  }

  def education_text
    EDUCATIONS.key self[:education]
  end

  def institutionalized_text
    INSTITUTIONALIZEDS.key self[:institutionalized]
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

  # Methods for relations
  def cognitive_tests( page= 0 )
    self.tests.where(category: 0).page page
  end

  def no_cognitive_tests( page= 0 )
    self.tests.where(category: 1).page page
  end

  def exploracion_funcional_tests( page= 0 )
    self.tests.where(category: 2).page page
  end

end
