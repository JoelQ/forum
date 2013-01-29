class Api::PostsController < ApplicationController
  def index
    posts = Post.for_activity_feed
    render json: posts
  end
end
