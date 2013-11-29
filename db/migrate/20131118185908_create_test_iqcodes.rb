class CreateTestIqcodes < ActiveRecord::Migration
  def change
    create_table :test_iqcodes do |t|
      t.integer :first
      t.integer :second
      t.integer :third
      t.integer :forth
      t.integer :fifth
      t.integer :sixth
      t.integer :seventh
      t.integer :eighth
      t.integer :ninth
      t.integer :tenth
      t.integer :eleventh
      t.integer :twelfth
      t.integer :thirteenth
      t.integer :fourteenth
      t.integer :fifteenth
      t.integer :sixteenth
      t.integer :seventeenth
      t.belongs_to :consultation, index: true

      t.timestamps
    end
  end
end
