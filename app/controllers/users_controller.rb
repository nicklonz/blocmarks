class UsersController < ApplicationController

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path(current_user)
    else
      render "devise/registrations/edit"
    end
  end

  def show
    @user = User.find(params[:id])
    @bookmarks = @user.bookmarks
    @user_topics = current_user.bookmarks.map {|bookmark| bookmark.topic }.uniq
    @favorited_topics = current_user.favorites.map {|favorite| favorite.bookmark.topic}.uniq
    @topics = @user_topics + @favorited_topics

    @favorites = @user.favorites
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:bookmark_id])
    @favorite = Favorite.find(params[:id])

    if @favorite.destroy
      redirect_to user_path(current_user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end