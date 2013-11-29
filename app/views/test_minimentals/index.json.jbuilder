json.array!(@test_minimentals) do |test_minimental|
  json.extract! test_minimental, :year, :station, :day_month, :day_week, :month, :country, :province, :city, :where, :flat, :objects, :attention, :memory, :pencil, :repeat, :orders, :eyes, :sentence, :draw
  json.url test_minimental_url(test_minimental, format: :json)
end
