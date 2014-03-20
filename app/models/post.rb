class Post < ActiveRecord::Base
  belongs_to :User
  default_scope -> { order('created_at DESC') }   
  validates :user_id, presence: true
    validates :postText, presence: true, length: { maximum: 500 }
    #adding comment functionality
    #acts_as_commentable
end
