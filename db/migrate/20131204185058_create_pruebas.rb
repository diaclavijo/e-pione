class CreatePruebas < ActiveRecord::Migration
  def change
    create_table :pruebas do |t|
      t.integer :prueba

      t.belongs_to :consultation, index: true
      t.timestamps
    end
  end
end
