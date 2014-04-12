class University < ActiveRecord::Base
has_many :educations

#method to update the average rating. This method will be called each time an education record is added or updated
def updateDisabilityDeptRating
      value = 0.00
    self.educations.each do |education|
      value = value + education.disabilityDeptRating 
    end
    total = self.educations.size
    update_attributes(disabilityDeptRating: value.to_f / total.to_f)
  end


end
