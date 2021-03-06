class PostsController < ApplicationController
  load_resource only: [:edit, :update, :destroy]
  authorize_resource

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
    render layout: false
  end

  def create
    @post = current_user.posts.new post_params.merge(topic_id: params[:topic_id])
    if @post.save
      redirect_to topic_posts_path(params[:topic_id])
    else
      render :new
    end
  end

  def update
    @post.content = params[:post][:content]
    if @post.save
      redirect_to topic_posts_path(params[:topic_id])
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to topic_posts_path(params[:topic_id])
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
