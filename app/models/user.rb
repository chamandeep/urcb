class User < ActiveRecord::Base
#before creating the user, convert email to lowercase
  #before_save { self.email = email.downcase }
#before creating the user, create the token to remember the user.
before_create :create_remember_token
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
has_many :Posts, dependent: :destroy

def login!(session)
    session[:user_id] = id
  end
  
  def self.logout!(session)
  session[:user_id] = nil
  end
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
def newsFeed
    # This is preliminary. See "Following users" for the full implementation.
    Post.where("user_id = ?", id)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end


    
  end
