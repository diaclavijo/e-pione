json.array!(@diagnoses) do |diagnosis|
  json.extract! diagnosis, 
  json.url diagnosis_url(diagnosis, format: :json)
end
