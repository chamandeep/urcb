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

has_many :educations
has_many :disabilities, through: :userDisability
has_many :friendships
has_many :posts, dependent: :destroy 
 has_many :friendships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :friendships, source: :followed
  
  has_many :reverse_friendships, foreign_key: "followed_id",
                                   class_name:  "Friendship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_friendships, source: :follower


  
  def following?(other_user)
    friendships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    friendships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    friendships.find_by(followed_id: other_user.id).destroy
  end
  
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
    Post.from_users_followed_by(self)
    end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end


    
  end
