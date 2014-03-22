class SessionsController < ApplicationController

def new

end

def create
  @user = User.find_by(email: params[:session][:email].downcase)
  if @user && @user.authenticate(params[:session][:password])

login @user
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
