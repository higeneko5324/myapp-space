class CommentsController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def create
    Comment.create(comment_params)
    redirect_to post_path(params[:post_id])
  end


  def destroy
    comment = Comment.find(params[:post_id])
    - if current_user.id == comment.user.id
          comment.destroy
          redirect_to post_path
      end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
