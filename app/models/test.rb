#this is the index of tests. Common information about every test is stored here to be able to show all the tests for a consultation or a patient

class Test < ActiveRecord::Base
	validates :consultation_id, :test_data_type, :test_data_id, presence: true


	# paginates_per 5
  belongs_to :consultation
  belongs_to :test_data, polymorphic: true
  has_one :patient, through: :consultation
  has_one :physician, through: :consultation

end
