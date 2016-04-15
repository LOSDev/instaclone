class SearchController < ApplicationController

  def index
    @term = params[:term]
    @users = User.where("username LIKE ?", "%#{@term}%")
    render json: @users.map { |user| {username: user.username, slug: user.slug, avatar: user.avatar.url(:thumb)} }
  end
end
