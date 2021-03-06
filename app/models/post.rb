class Post < ActiveRecord::Base
  #associations
  has_many :post_comments, dependent: :destroy
  
  
  belongs_to :user
  default_scope -> { order('created_at DESC') }   
  validates :user_id, presence: true
    validates :postText, presence: true, length: { maximum: 500 }
    #adding comment functionality
    #acts_as_commentable
    
      def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM friendships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end

end
