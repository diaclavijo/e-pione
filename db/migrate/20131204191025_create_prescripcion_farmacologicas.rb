class CreatePrescripcionFarmacologicas < ActiveRecord::Migration
  def change
    create_table :prescripcion_farmacologicas do |t|
      t.integer :tipo
      t.string :prescripcion

      t.belongs_to :consultation, index: true
      t.timestamps
    end
  end
end
