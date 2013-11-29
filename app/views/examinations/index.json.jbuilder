json.array!(@examinations) do |examination|
  json.extract! examination, :type, :consultation_id
  json.url examination_url(examination, format: :json)
end
