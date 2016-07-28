class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
    @new_bookmark = Bookmark.new

    render component: "BookmarksIndex", props: {bookmarks: @bookmarks}
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    respond_to do |format|
      format.json do
        if @bookmark.save
          render json: Bookmark.all
        else
          render json: @bookmark.errors.messages, status: 422
        end
      end
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    respond_to do |format|
      format.json do
        if @bookmark.destroy
          render json: Bookmark.all
        else
          render json: @bookmark.errors.messages, status: 422
        end
      end
    end
  end

  private

  def bookmark_params
    params[:bookmark].permit(:title, :url)
  end
end
