class Api::PostsController < ApplicationController
  def index
    posts = Post.select('posts.*, users.username AS author').joins(:user).order('created_at DESC').limit(5)
    render json: posts
  end
end
