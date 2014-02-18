class CreateDiagnoses < ActiveRecord::Migration
  def change
    create_table :diagnoses do |t|
      t.integer :diagnosis
      t.string :type
      t.float :probability
      t.text :observations

      t.belongs_to :consultation, index: true

      t.timestamps
    end
  end
end
