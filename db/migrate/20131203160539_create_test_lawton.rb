class CreateTestLawton < ActiveRecord::Migration
  def change
    create_table :test_lawtons do |t|
      t.integer :f1
      t.integer :f2
      t.integer :f3
      t.integer :f4
      t.integer :f5
      t.integer :f6
      t.integer :f7
      t.integer :f8

      t.belongs_to :consultation, index: true
      t.timestamps
    end
  end
end
