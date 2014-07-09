class BookmarksController < ApplicationController
  # def index
  #   # optional because the topic show is already showing all the booksmarks for a topic
  #   @bookmarks = Bookmark.all
  # end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

   def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = current_user.bookmarks.build(params.require(:bookmark).permit(:url))
    @bookmark.topic = @topic

    if @bookmark.save
      redirect_to @topic
    else
      render :new
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])

    url = @bookmark.url
    if @bookmark.destroy
      flash[:notice] = "\"#{url}\" was deleted successfully."
      redirect_to @topic
    else
      flash[:error] = "There was an error deleting the bookmark."
      render :show
    end
  end
end
