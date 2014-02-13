json.array!(@users) do |user|
  json.extract! user, :id, :firstName, :lastName, :email, :password, :userType, :dob, :bio
  json.url user_url(user, format: :json)
end
