class RemoveCreatedByFromTodos < ActiveRecord::Migration[5.2]
  def change
    remove_column :todos, :created_by
  end
end
