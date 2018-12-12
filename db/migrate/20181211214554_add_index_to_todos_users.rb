class AddIndexToTodosUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :todos_users, [:user_id, :todo_id], unique: true
  end
end
