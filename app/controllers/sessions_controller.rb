class SessionsController < ApplicationController

def new
@title = "Login"
end

def create
  @title = "Login"
  @user = User.find_by(email: params[:session][:email].downcase)
  if @user && @user.authenticate(params[:session][:password])
login @user
redirect_to root_url
  else
        flash.now[:error] = 'Invalid email/password combination'
      render 'new'

  end
end

def destroy
    logout
    redirect_to root_url

end
end
