class CreateNoCognitiveSymptomatologies < ActiveRecord::Migration
  def change
    create_table :no_cognitive_symptomatologies do |t|
      t.integer :psychomotor
      t.integer :lability
      t.integer :euphoria
      t.integer :apathy
      t.integer :depression
      t.integer :anxiety
      t.integer :hallucinations
      t.integer :delusions
      t.integer :disinhibition
      t.integer :motor
      t.integer :sleep

      t.belongs_to :consultation, index: true

      t.timestamps
    end
  end
end
