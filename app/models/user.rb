class User < ActiveRecord::Base
has_many :Educations
has_many :Disabilities, through: :UserDisability
has_many :Friendships
end
