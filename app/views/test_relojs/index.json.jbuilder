json.array!(@test_relojs) do |test_reloj|
  json.extract! test_reloj, :f1, :f2, :f3, :f4
  json.url test_reloj_url(test_reloj, format: :json)
end
