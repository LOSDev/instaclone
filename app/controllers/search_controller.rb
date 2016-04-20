class SearchController < ApplicationController

  def index
    @term = params[:term]
    @users = User.where("username LIKE ?", "%#{@term}%").limit(12)
    render json: @users.map { |user| {username: user.username, slug: user.slug, avatar: user.avatar.url(:thumb)} }
  end
end
