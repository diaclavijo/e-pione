json.array!(@patients) do |patient|
  json.extract! patient, :surname, :name, :birth, :gender, :civil_status, :NIF, :passport, :public_insurance_number, :private_insurance_number, :exitus, :phone_house, :mobile_phone, :other_phone, :address, :city, :state, :country, :education, :occupation, :employment, :economic_situation, :institutionalized
  json.url patient_url(patient, format: :json)
end
