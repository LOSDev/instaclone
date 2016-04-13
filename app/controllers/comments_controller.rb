class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    if @comment.save
      redirect_to @post, notice: "Comment created."
    else
      flash[:danger] = @comment.errors.full_messages.first
      redirect_to @post
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.find(params[:id]).delete
    redirect_to @post, notice: "Your comment was deleted."
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
