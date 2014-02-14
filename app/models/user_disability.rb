class UserDisability < ActiveRecord::Base
belongs_to :Disability
belongs_to :User
end
