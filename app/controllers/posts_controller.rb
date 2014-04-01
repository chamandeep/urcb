class PostsController < ApplicationController
  before_action :loged_in_user
  
  def show
    @post = Post.find(params[:id])
    #commentable = @post.create
#comment = commentable.comments.create
#comment.comment = "This is the first comment."
#comment.save

  end
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
redirect_to current_user
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
