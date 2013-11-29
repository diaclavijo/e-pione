json.array!(@test_yesavage4s) do |test_yesavage4|
  json.extract! test_yesavage4, :first, :second, :third, :forth, :consultation_id
  json.url test_yesavage4_url(test_yesavage4, format: :json)
end
