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
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.delete
    redirect_to current_user
  end

  private

  def post_params
    params.require(:post).permit(:description, :image)
  end
end
