class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all.with_tags_json
    @new_bookmark = Bookmark.new

    render component: "BookmarksIndex", props: {bookmarks: @bookmarks}
  end

  def tagged_with
    @bookmarks = Bookmark.tagged_with(params[:tag]).with_tags_json

    render component: "BookmarksIndex", props: {bookmarks: @bookmarks, taggedWith: params[:tag]}
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    respond_to do |format|
      format.json do
        if @bookmark.save
          render json: Bookmark.all.with_tags_json
        else
          render json: @bookmark.errors.messages, status: 422
        end
      end
    end
  end

  def update
    @bookmark = Bookmark.find(params[:id])

    respond_to do |format|
      format.json do
        if @bookmark.update(bookmark_params)
          render json: Bookmark.all.with_tags_json
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
          render json: Bookmark.all.with_tags_json
        else
          render json: @bookmark.errors.messages, status: 422
        end
      end
    end
  end

  private

  def bookmark_params
    params[:bookmark].permit(:title, :url, :tag_list)
  end
end
