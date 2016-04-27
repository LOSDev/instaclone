class PostsController < ApplicationController

  def new
    @post = current_user.posts.build
    @image_filters = Post::IMAGE_FILTERS
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.image_filter = params[:post][:image_filter]
    if @post.save
      redirect_to @post, notice: "Post has been saved."
    else
      @image_filters = Post::IMAGE_FILTERS
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

  def liked
    @likes = current_user.likes.count
    @posts = current_user.liked_posts.order("created_at DESC").paginate(page: params[:page], per_page: 12)
  end

  private

  def post_params
    params.require(:post).permit(:description, :image)
  end
end
