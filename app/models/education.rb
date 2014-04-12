class Education < ActiveRecord::Base
  after_save :updateUniversityRatings
  
  belongs_to :user
  belongs_to :course
  belongs_to :university
  
  #validations  
  
    validates :university_id, presence: true
      validates :course_id, presence: true
      #method to run the update method in the university model 
      def updateUniversityRatings
        university.updateDisabilityDeptRating
      end
end
