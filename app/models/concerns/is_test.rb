module IsTest
  extend ActiveSupport::Concern

  included do
		validates :score, inclusion: { in: 0..30, allow_nil: true }
		validates :score, numericality: {only_integer: true, allow_nil: true }
    belongs_to :consultation
    has_one :test, as: :test_data, dependent: :destroy

    before_create :store_score, :store_in_test_index
    before_update :update_in_test_index



		def get_score
			self.score || calc_score
		end


    private

		def store_score
			self.score = calc_score if score.nil?
		end



    def store_in_test_index
      self.create_test(consultation_id: self.consultation_id, score: self.score ) # 0 is for sintomatología cognitiva
    end

    def update_in_test_index
			self.score = calc_score if score.nil?
      self.test.update(score: self.score)
    end

  end

end