json.array!(@user_disabilities) do |user_disability|
  json.extract! user_disability, :id, :disability_id, :user_id, :severity, :supportRequired
  json.url user_disability_url(user_disability, format: :json)
end
