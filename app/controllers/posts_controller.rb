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
    @comments = @post.comments.includes(:user).paginate(page: params[:page])
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
      respond_to do |format|
        format.html { redirect_to @post, notice: "You like this post now." }
        format.js
      end
    else
      respond_to do |format|
        format.html do
          flash[:danger] = "Failed to like this post."
          redirect_to @post
        end
        format.js
      end
    end
  end

  def unlike
    @post = Post.find(params[:id])
    current_user.likes.find_by_post_id(@post.id).delete
    respond_to do |format|
      format.html {redirect_to @post}
      format.js {render "like"}
    end
  end

  def liked
    @posts = current_user.liked_posts.order("created_at DESC").paginate(page: params[:page], per_page: 12)
  end

  private

  def post_params
    params.require(:post).permit(:description, :image)
  end
end
