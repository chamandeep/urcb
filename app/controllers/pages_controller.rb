class PagesController < ApplicationController
  def home
    @post = current_user.Posts.build if loged_in?
  end

  def about
  end

  def contact
  end
def logout
  @title = "You have been logged out"
            User.logout!(session)
    redirect_to :controller => :pages, :action => :home
      end  
	  
  def login
@title = "Login"
  if request.post?
      @user = User.new(user_params)
	        user = User.find_by_email_and_password(@user.email, @user.password)
			      if user
        session[:user_id] = user.id
		#redirect_to(:controller => 'users', :action => 'home')
	
		end
  end
end

private
  def user_params
  params.require(:user).permit(:email, :password)
  end
end
