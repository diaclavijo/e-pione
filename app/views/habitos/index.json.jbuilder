json.array!(@habitos) do |habitos|
  json.extract! habitos_paciente, :habito, :comentario
  json.url habitos_url(habitos, format: :json)
end
