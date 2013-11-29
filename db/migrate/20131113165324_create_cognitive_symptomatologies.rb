class CreateCognitiveSymptomatologies < ActiveRecord::Migration
  def change
    create_table :cognitive_symptomatologies do |t|
      t.integer :memory
      t.integer :disorientation
      t.integer :aphasia
      t.integer :apraxia
      t.integer :agnosia
      t.integer :executive
      t.integer :reasoning
      t.integer :spatial

      t.belongs_to :consultation, index: true

      t.timestamps
    end
  end
end
