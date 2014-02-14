class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :surname
      t.string :name
      t.date :birth
      t.integer :gender
      t.boolean :exitus
      t.integer :education
      t.integer :id2

      t.timestamps
    end
    add_index :patients, :surname
    add_index :patients, :name
    add_index :patients, :id2
  end
end
