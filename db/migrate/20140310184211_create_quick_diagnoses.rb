class CreateQuickDiagnoses < ActiveRecord::Migration
  def change
    create_table :quick_diagnoses do |t|
      t.integer :diagnosis
      t.float :probability
      t.integer :faq_score
      t.integer :education
      t.integer :mmse_score
      t.float :age

			t.belongs_to :physician, index: true

      t.timestamps
    end
  end
end
