class Article < ActiveRecord::Base
  belongs_to :user
  
#order by recently updated
default_scope -> { order('updated_at DESC') }  
  

  
end
