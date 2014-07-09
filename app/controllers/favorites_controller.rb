class FavoritesController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:bookmark_id])
    favorite = current_user.favorites.build(bookmark: @bookmark)

    if favorite.save
      flash[:notice] = "Favorited bookmark"
    else
      flash[:error] = "Unable to add favorite. Please try again."
    end
    redirect_to @topic
  end

  def destroy
  @topic = Topic.find(params[:topic_id])
  @bookmark = @topic.bookmarks.find(params[:bookmark_id])
  favorite = current_user.favorites.find(params[:id])

    if favorite.destroy
      flash[:notice] = "Removed favorite."
    else
      flash[:error] = "Unable to remove favorite. Please try again."
    end
    redirect_to @topic
  end
end

