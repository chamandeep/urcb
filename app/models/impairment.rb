class Impairment < ActiveRecord::Base
  belongs_to :disability_id
  belongs_to :user_id
end
