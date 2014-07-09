class BookmarksController < ApplicationController
  # def index
  #   # optional because the topic show is already showing all the booksmarks for a topic
  #   @bookmarks = Bookmark.all
  # end

  # def new
  #   @bookmark = Bookmark.new
  # end

  # def create

  # end

     def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])

    title = @bookmark.title
    authorize @bookmark
    if @bookmark.destroy
      flash[:notice] = "\"#{url}\" was deleted successfully."
      redirect_to @topic
    else
      flash[:error] = "There was an error deleting the bookmark."
      render :show
    end
  end
end
