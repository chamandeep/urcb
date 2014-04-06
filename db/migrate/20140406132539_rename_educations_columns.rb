class RenameEducationsColumns < ActiveRecord::Migration
  def change
    rename_column :educations, :User_id, :user_id
    rename_column :educations, :Course_id, :course_id
    rename_column :educations, :University_id, :university_id
    
  end
end
