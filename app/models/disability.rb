class Disability < ActiveRecord::Base
has_many :Disabilities, through: :UserDisability
end
