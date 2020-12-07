class RemoveBookmarkFromBookmarks < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookmarks, :bookmark, :string
  end
end
