json.array!(@test_pfeiffers) do |test_pfeiffer|
  json.extract! test_pfeiffer, :f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :f11, :consultation_id
  json.url test_pfeiffer_url(test_pfeiffer, format: :json)
end
