class CreateJoinTableUserTodo < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :todos do |t|
      # t.index [:user_id, :todo_id]
      # t.index [:todo_id, :user_id]
    end
  end
end
