class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :find_user

  def show
    @posts = @user.posts.paginate(:page => params[:page], :per_page => 12)
  end

  def follow
    current_user.following_relationships.create(followed_id: @user.id)
    redirect_to @user, notice: "You are now following #{@user.username}."
  end

  def unfollow
    current_user.following_relationships.find_by_followed_id(@user.id).delete
    redirect_to @user, notice: "You are not following #{@user.username} anymore."
  end

  def following
    @users = current_user.followed_users
  end

  def followers
    @users = current_user.followers
  end
  private

  def find_user
    @user = User.friendly.find(params[:id])
  end
end
