# This remove the considered unnnecessary information from the patient.
# and adds an :id2 for the physician to have an own identifier.
class RemoveExtraDataFromPatient < ActiveRecord::Migration
  def change

    remove_column :patients, :gender, :integer
    remove_column :patients, :civil_status, :integer
    remove_column :patients, :NIF, :string
    remove_column :patients, :passport, :string
    remove_column :patients, :public_insurance_number, :string
    remove_column :patients, :private_insurance_number, :string
    remove_column :patients, :phone_house, :integer
    remove_column :patients, :mobile_phone, :integer
    remove_column :patients, :other_phone, :integer
    remove_column :patients, :address, :text
    remove_column :patients, :city, :string
    remove_column :patients, :state, :string
    remove_column :patients, :country, :string
    remove_column :patients, :occupation, :integer
    remove_column :patients, :employment, :integer
    remove_column :patients, :economic_situation, :integer

    add_column    :patients, :id2, :integer
    #remove_column :patients, :surname, :string
    #remove_column :patients, :name, :string
    #remove_column :patients, :institutionalized, :integer
    #remove_column :patients, :education, :integer
    #remove_column :patients, :exitus, :boolean
    #remove_column :patients, :birth, :date
  end
end
