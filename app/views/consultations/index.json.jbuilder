json.array!(@consultations) do |consultation|
  json.extract! consultation, :Patient_id, :Physician_id, :activity, :date, :description
  json.url consultation_url(consultation, format: :json)
end
