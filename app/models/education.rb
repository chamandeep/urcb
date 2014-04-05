class Education < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  belongs_to :university
  
  #validations
  
    validates :University_id, presence: true
      validates :Course_id, presence: true
end
