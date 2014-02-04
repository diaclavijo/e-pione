class CreatePathologies < ActiveRecord::Migration
  def change
    create_table :pathologies do |t|
      t.integer :pathology

      t.belongs_to :consultation, index: true
      t.timestamps
    end
  end
end
