class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def follow
    @user = User.find(params[:id])
    current_user.following_relationships.create(followed_id: @user.id)
    redirect_to @user
  end
end
