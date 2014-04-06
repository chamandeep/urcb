class Education < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  belongs_to :university
  
  #validations  
  
    validates :university_id, presence: true
      validates :course_id, presence: true
end
