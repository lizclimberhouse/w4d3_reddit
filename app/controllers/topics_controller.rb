class TopicsController < ApplicationController
  before_action :set_sub # needs to be before if we need it in the set_topic
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = @sub.topics
  end

  def show
  end

  def new
    @topic = @sub.topics.new #because it has_many relationship
  end

  def edit
  end

  def create
    @topic = @sub.topics.new(topic_p)

    if @topic.save
      redirect_to sub_topic_path(@sub, @topic)
      # redirect_to [@sub, @topic] same same ^
    else
      render :new
    end
  end

  def update
    if @topic.update(topic_p)
      redirect_to sub_topic_path(@sub, @topic)
      # redirect_to [@sub, @topic] # same same ^
    else
      render :edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to sub_topics_path # go back to the list of all of topics
  end

  private
  def set_sub
    @sub = Sub.find(params[:sub_id])
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_p 
    params.require(:topic).permit(:name, :body)
  end

  end
