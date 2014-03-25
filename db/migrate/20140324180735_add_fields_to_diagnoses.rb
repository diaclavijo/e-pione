class AddFieldsToDiagnoses < ActiveRecord::Migration
  def change
    add_reference :diagnoses, :physician, index: true
    add_column :diagnoses, :faq_score, :integer
    add_column :diagnoses, :mmse_score, :integer
    add_column :diagnoses, :education, :integer
    add_column :diagnoses, :age, :float
  end
end
