json.array!(@no_cognitive_symptomatologies) do |no_cognitive_symptomatology|
  json.extract! no_cognitive_symptomatology, :psychomotor, :lability, :euphoria, :apathy, :depression, :anxiety, :hallucinations, :delusions, :disinhibition, :motor, :sleep
  json.url no_cognitive_symptomatology_url(no_cognitive_symptomatology, format: :json)
end
