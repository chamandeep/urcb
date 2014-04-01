class UserDisability < ActiveRecord::Base
belongs_to :disability
belongs_to :user
end
