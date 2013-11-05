class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :surname
      t.string :name
      t.date :birth
      t.string :gender
      t.string :civil_status
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
      t.string :education
      t.string :occupation
      t.string :employment
      t.string :economic_situation
      t.string :institutionalized

      t.timestamps
    end
    add_index :patients, :surname
    add_index :patients, :name
    add_index :patients, :NIF, unique: true
    add_index :patients, :passport, unique: true
  end
end
