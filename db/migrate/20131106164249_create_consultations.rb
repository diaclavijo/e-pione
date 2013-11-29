class CreateConsultations < ActiveRecord::Migration
  def change
    create_table :consultations do |t|
      t.belongs_to :patient, index: true
      t.belongs_to :physician, index: true
      t.integer :activity
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end
