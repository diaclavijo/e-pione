class Patient < ActiveRecord::Base


  has_many :consultations
  has_many :physicians, through: :consultations

  # Validations
  validates :name, :surname, presence: true

  # Configuration
  paginates_per 10

  nilify_blanks  # for avoid storing empty strings in database , instead is null


  # Enum types and functions for select methods
  GENDERS = { 'Hombre arisco' => 0, 'Mujer' => 1, 'Desconocido' => 2 }

  CIVIL_STATUSES = { Soltero: 0, Casado: 1, Viudo: 2, Divorciado: 3, Desconocido: 4}

  EDUCATIONS = { 'Desconocido' => 0, 'Analfabeto' => 1, 'Lee y escribe' => 2, 'Estudios mínimos' => 3 , 'Estudios Primarios' => 4 , 'Estudios Secundarios' => 5, 'Estudios Universitarios' => 6 }

  OCCUPATIONS = { 'Desconocido' => 0, 'Manual no especializado' => 1, 'Manual especializado' => 2, 'Técnico' => 3 , 'Intelectual' => 4  }

  EMPLOYMENTS = { 'Desconocido' => 0, 'Jubilado' => 1, 'Activo' => 2, 'Desempleado' => 3 , 'Pendiente' => 4, 'Otros' => 5  }

  ECONOMIC_SITUATIONS = { 'Desconocido' => 0, 'Pobre' => 1, 'Mala' => 2, 'Normal' => 3 , 'Buena' => 4, 'Muy buena' => 5  }

  INSTITUTIONALIZEDS = { 'Desconocido' => 0, 'No' => 1, 'Hospital' => 2, 'Residencia' => 3 , 'Clínica' => 4, 'Otro' => 5  }

  def gender_text
    GENDERS.key self[:gender]
  end

  def civil_status_text
    CIVIL_STATUSES.key self[:civil_status]
  end

  def education_text
    EDUCATIONS.key self[:education]
  end

  def occupation_text
    OCCUPATIONS.key self[:occupation]
  end

  def employment_text
    EMPLOYMENTS.key self[:employment]
  end

  def economic_situation_text
    ECONOMIC_SITUATIONS.key self[:economic_situation]
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



end
