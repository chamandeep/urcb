json.array!(@disabilities) do |disability|
  json.extract! disability, :id, :name, :description
  json.url disability_url(disability, format: :json)
end
