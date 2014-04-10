class PostCommentsController < ApplicationController
  
  def create
        @post_comment = current_user.post_comments.build(post_comments_params)
    if @post_comment.save
      flash[:success] = "Comment added!"
redirect_to @post_comment.post
    else
      flash[:error] = 'There was a problem and your post was not created. Please try again.'
      redirect_to @post_comment.post
    end

  end
  
  private
  def post_comments_params
          params.require(:post_comment).permit(:post_id, :comment)
  end
end
