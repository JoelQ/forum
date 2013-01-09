class PostsController < ApplicationController
  def index
    @topic = Topic.find params[:topic_id]
    @posts = @topic.posts
  end

  def new
    @topic = Topic.find params[:topic_id]
    @post = Post.new
  end

  def edit
    @topic = Topic.find params[:topic_id]
    @post = Post.find params[:id]
  end

  def create
    @post = Post.new params[:post].merge({topic_id: params[:topic_id], user_id: current_user.id})
    if @post.save
      redirect_to topic_posts_path(params[:topic_id])
    else
      render :new
    end
  end

  def update
    @post = Post.find params[:id]
    @post.content = params[:post][:content]
    if @post.save
      redirect_to topic_posts_path(params[:topic_id])
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to topic_posts_path(params[:topic_id])
  end
end
