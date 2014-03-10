class CreateQuickDiagnoses < ActiveRecord::Migration
  def change
    create_table :quick_diagnoses do |t|
      t.integer :diagnosis
      t.float :probability
      t.integer :score_faq
      t.integer :education
      t.integer :score_mmse
      t.float :age

			t.belongs_to :physician, index: true

      t.timestamps
    end
  end
end
