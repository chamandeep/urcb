class Article < ActiveRecord::Base
  belongs_to :user
  
  
  #method to retreve all articles which have been approved
  def approved
    self.status === 2
  end
  
end
