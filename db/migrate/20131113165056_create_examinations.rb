class CreateExaminations < ActiveRecord::Migration
  def change
    create_table :examinations do |t|

      t.references :examination_data, polymorphic: true

      t.belongs_to :consultation, index: true

      t.timestamps
    end
  end
end
