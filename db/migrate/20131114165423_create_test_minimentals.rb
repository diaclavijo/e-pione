class CreateTestMinimentals < ActiveRecord::Migration
  def change
    create_table :test_minimentals do |t|
      t.integer :f1
      t.integer :f2
      t.integer :f3
      t.integer :f4
      t.integer :f5
      t.integer :f6
      t.integer :f7
      t.integer :f8
      t.integer :f9
      t.integer :f10
      t.integer :f11
      t.integer :f12
      t.integer :f13
      t.integer :f14
      t.integer :f15
      t.integer :f16
      t.integer :f17
      t.integer :f18
      t.integer :f19

      t.belongs_to :consultation, index: true

      t.timestamps
    end
  end
end
