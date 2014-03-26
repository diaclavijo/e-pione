class AddCorrectToDiagnoses < ActiveRecord::Migration
  def change
    add_column :diagnoses, :correct, :integer
  end
end
