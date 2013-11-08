json.array!(@cognitive_symptomatologies) do |cognitive_symptomatology|
  json.extract! cognitive_symptomatology, :Consultation_id, :memory, :disorientation, :aphasia, :apraxia, :agnosia, :executive, :reasoning, :spatial
  json.url cognitive_symptomatology_url(cognitive_symptomatology, format: :json)
end
