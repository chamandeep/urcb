json.array!(@universities) do |university|
  json.extract! university, :id, :name, :url, :disabilityURL, :disabilityDeptRating, :courseDeptRating
  json.url university_url(university, format: :json)
end
