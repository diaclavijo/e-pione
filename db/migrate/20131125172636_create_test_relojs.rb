class CreateTestRelojs < ActiveRecord::Migration
  def change
    create_table :test_relojs do |t|
      t.integer :f1
      t.integer :f2
      t.integer :f3
      t.integer :f4

      t.belongs_to :consultation, index: true

      t.timestamps
    end
  end
end
