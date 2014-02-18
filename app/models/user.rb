class User < ActiveRecord::Base
#convert email address to lowercase before saving
before_save { self.email = email.downcase }

#validations
validates :firstName, presence: true
validates :lastName, presence: true
validates :email, presence: true, uniqueness: true
has_many :Educations
has_many :Disabilities, through: :UserDisability
has_many :Friendships

def login!(session)
    session[:user_id] = id
  end
  
  def self.logout!(session)
  session[:user_id] = nil
  end

end
