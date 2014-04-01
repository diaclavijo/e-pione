class Physician < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :registerable

  validates :name, :surname, presence: true

	has_many :computer_diagnoses, dependent: :nullify

  def full_name
    self[:name] + ' ' + self[:surname]
  end
end
