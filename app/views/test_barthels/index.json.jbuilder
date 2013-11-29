json.array!(@test_barthels) do |test_barthel|
  json.extract! test_barthel, :f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10
  json.url test_barthel_url(test_barthel, format: :json)
end
