class CreateTestFast < ActiveRecord::Migration
  def change
    create_table :test_fasts do |t|
      t.integer :f1

      t.belongs_to :consultation, index: true
      t.timestamps
    end
  end
end
