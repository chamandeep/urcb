class Article < ActiveRecord::Base
  belongs_to :user
  
#order by recently updated
default_scope -> { order('updated_at DESC') }  
  #method to retreve all articles which have been approved
  def approved
    self.status === 2
  end
  
end
