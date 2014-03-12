json.array!(@educations) do |education|
  json.extract! education, :id, :User_id, :Course_id, :University_id, :startDate, :endDate, :accessibilityReview, :supportRequested, :supportReceived, :reason, :disabilityDeptRating, :courseDeptRating
  json.url education_url(education, format: :json)
end
