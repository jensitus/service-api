class AddCreatedByToTodos < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :created_by, :bigint
  end
end
