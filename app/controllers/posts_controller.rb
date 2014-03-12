class PostsController < ApplicationController
  before_action :loged_in_user
  
  def show
    @post = Post.find(params[:id])
  end
  def create
    @post = current_user.Posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
redirect_to current_user
    else
      render 'pages/home'
    end
    
  end
  
  def destroy
    
  end
    private

    def post_params
      params.require(:post).permit(:postText)
    end
end
