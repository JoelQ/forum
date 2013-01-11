class TopicsController < ApplicationController
  authorize_resource

  def index
    @category = Category.find params[:category_id]
    @topics = @category.topics
  end

  def new
    @category = Category.find params[:category_id]
    @topic = Topic.new
  end

  def edit
    @category = Category.find params[:category_id]
    @topic = Topic.find params[:id]
  end

  def create
    @category = Category.find params[:category_id]
    @topic = @category.topics.new topic_params.merge(user_id: current_user.id)
    if @topic.save
      redirect_to category_topics_path(@category)
    else
      render :new
    end
  end

  def update
    @topic = Topic.find params[:id]
    if @topic.update_attributes topic_params
      redirect_to topic_posts_path(@topic)
    else
      render :edit
    end
  end

  def destroy
    topic = Topic.find params[:id]
    topic.destroy
    redirect_to category_topics_path(params[:category_id])
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :content)
  end
end
