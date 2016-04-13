class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def follow
    @user = User.find(params[:id])
    current_user.following_relationships.create(followed_id: @user.id)
    redirect_to @user, notice: "You are now following #{@user.username}."
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.following_relationships.find_by_followed_id(@user.id).delete
    redirect_to @user, notice: "You are not following #{@user.username} anymore."
  end
end
