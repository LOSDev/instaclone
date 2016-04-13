class PostsController < ApplicationController

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: "Post has been saved."
    else
      flash.now[:danger] = "Unable to save your post."
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comments = @post.comments
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.delete
    redirect_to current_user
  end

  def like
    @post = Post.find(params[:id])
    @like = current_user.likes.build(post: @post)
    if @like.save
      redirect_to @post, notice: "You like this post now."
    else
      flash[:danger] = "Failed to like this post"
      redirect_to @post
    end
  end

  def unlike
    @post = Post.find(params[:id])
    current_user.likes.find_by_post_id(@post.id).delete
    redirect_to @post
  end

  private

  def post_params
    params.require(:post).permit(:description, :image)
  end
end
