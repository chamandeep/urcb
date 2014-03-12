class Education < ActiveRecord::Base
  belongs_to :User
  belongs_to :Course
  belongs_to :University
end
