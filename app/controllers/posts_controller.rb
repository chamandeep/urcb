class PostsController < ApplicationController
  before_action :loged_in_user
  
  def show
    @post = Post.find(params[:id])

@title = "Comments"
@post_comment = current_user.post_comments.build
@comments = @post.post_comments.all
  end
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
redirect_to root_url
    else
      flash[:error] = 'There was a problem and your post was not created. Please try again.'
      redirect_to current_user
    end
    
  end
  
  def destroy
    
  end
    private

    def post_params
      params.require(:post).permit(:postText)
    end
end
