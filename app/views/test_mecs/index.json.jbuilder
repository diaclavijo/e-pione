json.array!(@test_mecs) do |test_mec|
  json.extract! test_mec, :f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :f11, :f12, :f13, :consultation_id
  json.url test_mec_url(test_mec, format: :json)
end
