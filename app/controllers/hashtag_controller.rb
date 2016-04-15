class HashtagController < ApplicationController

  def index
    @hashtag = params[:id]
    @posts = Post.where("description LIKE ?", "%#{@hashtag}%")
  end
end
