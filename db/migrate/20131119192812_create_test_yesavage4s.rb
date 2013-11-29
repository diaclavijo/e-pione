class CreateTestYesavage4s < ActiveRecord::Migration
  def change
    create_table :test_yesavage4s do |t|
      t.integer :first
      t.integer :second
      t.integer :third
      t.integer :forth
      t.belongs_to :consultation, index: true

      t.timestamps
    end
  end
end
