class AddUserToTodos < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :user_id, :bigint
  end
end
