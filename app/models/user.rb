class User < ActiveRecord::Base
#convert email address to lowercase before saving
before_save { self.email = email.downcase }
#implementing BCrypt functionality for encryption of passwords
has_secure_password
#validations
validates :firstName, presence: true
validates :lastName, presence: true
validates :email, presence: true, uniqueness: {  case_sensative: false }
validates :password, length: { minimum: 6 }

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
