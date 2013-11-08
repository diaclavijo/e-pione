class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :surname
      t.string :name
      t.date :birth
      t.integer :gender
      t.integer :civil_status
      t.string :NIF
      t.string :passport
      t.string :public_insurance_number
      t.string :private_insurance_number
      t.boolean :exitus
      t.integer :phone_house
      t.integer :mobile_phone
      t.integer :other_phone
      t.text :address
      t.string :city
      t.string :state
      t.string :country
      t.integer :education
      t.integer :occupation
      t.integer :employment
      t.integer :economic_situation
      t.integer :institutionalized

      t.timestamps
    end
    add_index :patients, :surname
    add_index :patients, :name
    add_index :patients, :NIF, unique: true
    add_index :patients, :passport, unique: true
  end
end
