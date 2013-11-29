class Physician < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :surname, presence: true

  has_many :consultations
  has_many :patients, through: :consultations
  has_many :tests, through: :consultations
  has_many :examinations, through: :consultations

  def full_name
    self[:name] + ' ' + self[:surname]
  end
end
