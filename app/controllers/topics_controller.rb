class TopicsController < ApplicationController

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
    @topic = Topic.new params[:topic].merge({category_id: params[:category_id]})
    if @topic.save
      redirect_to category_topics_path(params[:category_id])
    else
      render :new
    end
  end

  def update
    @topic = Topic.find params[:id]
    if @topic.update_attributes params[:topic]
      redirect_to topic_posts_path(@topic)
    else
      render :edit
    end
  end

  def destroy
    @topic = Topic.find params[:id]
    @topic.destroy
    redirect_to category_topics_path(params[:category_id])
  end
end
