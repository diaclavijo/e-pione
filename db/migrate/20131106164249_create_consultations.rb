class CreateConsultations < ActiveRecord::Migration
  def change
    create_table :consultations do |t|
      t.references :patient, index: true
      t.references :physician, index: true
      t.integer :activity
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end
