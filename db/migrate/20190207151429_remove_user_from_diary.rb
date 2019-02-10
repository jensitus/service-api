class RemoveUserFromDiary < ActiveRecord::Migration[5.2]
  def change
    remove_column :diaries, :user, :integer
    add_column :diaries, :user_id, :bigint
  end
end
