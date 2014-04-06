class UsersController < ApplicationController
  #before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :loged_in_user, only: [:edit, :index, :update, :destroy, :following, :followers]
    before_action :correct_user,   only: [:edit, :update]
    
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
        def index
        @users = User.paginate(page: params[:page])
  end
  
  def show
      @user = User.find(params[:id])
          @posts = @user.posts.paginate(page: params[:page])
                        @post = current_user.posts.build if loged_in?
@educations = @user.educations
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
redirect_to root_path
flash[:success] = "Your account has been registered and you have been loged in successfully."        
      else
render new
      end
    end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
end    
 
  private
   

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:firstName, :lastName, :email, :password, :password_confirmation, :userType, :dob, :bio)
    end
    


end
