class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :find_user, except: [:feed]

  def show
    @posts = @user.posts.order("created_at DESC").paginate(:page => params[:page], :per_page => 12)
  end

  def follow
    rel = current_user.following_relationships.build(followed_id: @user.id)
    if rel.save
      respond_to do |format|
        format.html { redirect_to @user, notice: "You are now following #{@user.username}." }
        format.js
      end
    else
      respond_to do |format|
        format.html do
          flash[:danger] = "You already follow this user."
          redirect_to @user
        end
        format.js
      end
    end
  end

  def unfollow
    current_user.following_relationships.find_by_followed_id(@user.id).delete
    respond_to do |format|
      format.html {redirect_to @user, notice: "You are not following #{@user.username} anymore."}
      format.js { render "follow"}
    end
  end

  def following
    @users = @user.followed_users.paginate(page: params[:page], per_page: 15)
  end

  def followers
    @users = @user.followers.paginate(page: params[:page], per_page: 15)
  end

  def feed
    @posts = current_user.feed.paginate(page: params[:page], per_page: 12)
  end

  private

  def find_user
    @user = User.friendly.find(params[:id])
  end
end
