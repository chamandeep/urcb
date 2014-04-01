class Disability < ActiveRecord::Base
has_many :disabilities, through: :userDisability
end
