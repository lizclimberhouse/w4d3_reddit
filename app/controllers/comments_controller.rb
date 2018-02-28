class CommentsController < ApplicationController
  before_action :set_topic
  
  def new
    @comment = @topic.comments.new
  end

  def create
    @comment = @topic.comments.new(comment_params)

    if @comment.save
      redirect_to sub_topic_path(@topic.sub_id, @topic) # cant do @sub bc how do we find the sub id? therefore we use @topic.sub_id which is the forign key
    else
      render :new
    end
  end

  private
    def set_topic
      @topic = Topic.find(params[:topic_id])
    end

    def comment_params
      params.require(:comment).permit(:author, :body)
    end
end
