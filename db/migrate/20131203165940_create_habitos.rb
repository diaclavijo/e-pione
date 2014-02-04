class CreateHabitos < ActiveRecord::Migration
  def change
    create_table :habitos do |t|
      t.integer :habito
      t.string :comentario

      t.belongs_to :consultation, index: true
      t.timestamps
    end
  end
end
