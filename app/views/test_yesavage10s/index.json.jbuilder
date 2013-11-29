json.array!(@test_yesavage10s) do |test_yesavage10|
  json.extract! test_yesavage10, :f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :consultation_id
  json.url test_yesavage10_url(test_yesavage10, format: :json)
end
