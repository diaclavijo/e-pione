class CreateTestKatz < ActiveRecord::Migration
  def change
    create_table :test_katzs do |t|
      t.integer :f1

      t.belongs_to :consultation, index: true
      t.timestamps
    end
  end
end
