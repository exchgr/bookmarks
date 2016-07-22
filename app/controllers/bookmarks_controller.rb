class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save
      redirect_to root_path
    else
      render action: "new"
    end
  end

  private

  def bookmark_params
    params[:bookmark].permit(:title, :url)
  end
end
