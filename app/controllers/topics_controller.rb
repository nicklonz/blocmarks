class TopicsController < ApplicationController
  
  def index
    # show all topics
  end

  def show
    # show one topic and all it's bookmakrks
  end

  def new
    @topic = Topic.new
  end

  def create
    # create a new topic
  end


  def destroy
    # destroy topic
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    # save updated topic
  end
end
