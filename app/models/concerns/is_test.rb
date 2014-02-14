module IsTest
  extend ActiveSupport::Concern

  included do
    validates :consultation_id, presence: true

    belongs_to :consultation
    has_one :test, as: :test_data, dependent: :destroy

    before_create :store_in_test_index
    before_update :update_in_test_index

    private

    def store_in_test_index
      self.create_test(consultation_id: self.consultation_id, score: self.score ) # 0 is for sintomatología cognitiva
    end

    def update_in_test_index
      self.test.update(score: self.score)
    end

  end

end