class RemoveUserFromBookmarks < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookmarks, :user, :string
  end
end
