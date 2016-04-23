class HashtagController < ApplicationController

  def index
    @hashtag = params[:id]
    @posts = Post.where("description LIKE ?", "%#{@hashtag}%").order("created_at DESC").paginate(page: params[:page], per_page: 12)
  end
end
