class RequireBookmarkTitleAndUrl < ActiveRecord::Migration[5.0]
  def change
    change_column_null :bookmarks, :title, false
    change_column_null :bookmarks, :url, false
  end
end
