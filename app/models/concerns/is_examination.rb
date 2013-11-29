module IsExamination
  extend ActiveSupport::Concern

  included do
    belongs_to :consultation
    has_one :examination, as: :examination_data, dependent: :destroy

    before_create :store_in_examination_index

    private

    def store_in_examination_index
      self.create_examination(consultation_id: self.consultation_id)
    end
  end

end