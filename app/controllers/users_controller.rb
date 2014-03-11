class UsersController < ApplicationController
  #before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :loged_in_user, only: [:edit, :index, :update, :destroy]
    before_action :correct_user,   only: [:edit, :update]
    
    
  # GET /users
  # GET /users.json
  def index
        @users = User.paginate(page: params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
      @user = User.find(params[:id])
          @posts = @user.Posts.paginate(page: params[:page])
              @post = current_user.Posts.build if loged_in?
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

          if @user.save
login @user
flash[:notice] = "You have been logged in"        
redirect_to @user
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
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:firstName, :lastName, :email, :password, :password_confirmation, :userType, :dob, :bio)
    end
    

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
