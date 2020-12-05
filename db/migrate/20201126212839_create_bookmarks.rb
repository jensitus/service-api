class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.string :bookmark
      t.string :description
      t.integer :user

      t.timestamps
    end
  end
end
