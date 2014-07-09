  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:bookmark_id])
    favorite = current_user.favorites.build(bookmark: @bookmark)

    if favorite.save
      flash[:notice] = "Favorited Bookmark"
      redirect_to [@topic, @bookmark]
    else
      flash[:error] = "Unable to add favorite. Please try again."
      redirect_to [@topic, @bookmark]
    end
  end
