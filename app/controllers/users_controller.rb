class UsersController < ApplicationController
  

  
  def index
    @users = User.all
  end

    def show
  end

  
  def new
    @user = User.new
  end

  
  def edit
  end

  
  def create
    @user = User.new(user_params)

          if @user.save
login @user

redirect_to @user
      else
render new
      end
    end
  
    def update
    
    
  end

  
  def destroy
    
  end

  private
   

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:firstName, :lastName, :email, :password, :password_confirmation, :userType, :dob, :bio)
    end
end
