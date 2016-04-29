class CommentsController < ApplicationController

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.paginate(page: params[:page])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    respond_to do |format|
      if @comment.save
        format.html {redirect_to @post, notice: "Comment created."}
        format.js
      else
        format.html do
          flash[:danger] = @comment.errors.full_messages.first
          redirect_to @post
        end
        format.js
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.find(params[:id]).delete
    respond_to do |format|
      format.html {redirect_to @post, notice: "Your comment was deleted."}
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
