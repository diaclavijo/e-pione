class Patient < ActiveRecord::Base
  validates :name, :surname, presence: true
  paginates_per 10

  def self.search(search, search_type)
    wildcard_search = "%#{search}%"

    case search_type
      when 'all'
        Patient.where("name LIKE :search OR surname LIKE :search", search: wildcard_search)
      when 'name'
        Patient.where("name LIKE :search", search: wildcard_search)
      when 'surname'
        Patient.where("surname LIKE :search", search: wildcard_search)
    end




  end
end
