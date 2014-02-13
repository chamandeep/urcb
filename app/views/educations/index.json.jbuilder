json.array!(@educations) do |education|
  json.extract! education, :id, :user_id, :course_id, :university_id, :startDate, :endDate, :accessibilityReview, :supportRequested, :supportReceived, :reason, :disabilityDeptRating, :courseDeptRating
  json.url education_url(education, format: :json)
end
