class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def new
  end

  def destroy
  end
end
