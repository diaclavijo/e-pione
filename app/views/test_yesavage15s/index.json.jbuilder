json.array!(@test_yesavage15s) do |test_yesavage15|
  json.extract! test_yesavage15, :f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :f11, :f12, :f13, :f14, :f15, :consultation_id
  json.url test_yesavage15_url(test_yesavage15, format: :json)
end
