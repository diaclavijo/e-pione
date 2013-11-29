json.array!(@physical_examinations) do |physical_examination|
  json.extract! physical_examination, :talla, :peso, :tension, :f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :f11, :f12, :f13, :f14, :consultation_id
  json.url physical_examination_url(physical_examination, format: :json)
end
