class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
    @new_bookmark = Bookmark.new
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: Bookmark.all }
      end
    else
      respond_to do |format|
        format.html { render action: "new" }
        format.json { render json: @bookmark.errors.messages, status: 422 }
      end
    end
  end

  private

  def bookmark_params
    params[:bookmark].permit(:title, :url)
  end
end
