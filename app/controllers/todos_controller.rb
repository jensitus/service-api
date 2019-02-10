class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy, :add_user, :users]

  # GET /todos
  def index
    @todos = current_user.todos
    json_response(@todos)
  end

  # POST /todos
  def create
    @todo = current_user.todos.create!(title: todo_params['title'], created_by: current_user.id)
    json_response(@todo, :created)
  end

  # GET /todos/:id
  def show
    json_response(@todo)
  end

  # PUT /todos/:id
  def update
    @todo.update(todo_params)
    head :no_content
  end

  # DELETE /todos/:id
  def destroy
    @todo.destroy
    head :no_content
  end

  # POST /todos/:id/add_user
  def add_user
    user = User.find add_user_params
    @todo.users.push user
    json_response(message: 'jepp', :status => :success)
  end

  # GET /todos/:id/users
  def users
    json_response(@todo.users)
  end

  private

  def todo_params
    # whitelist params
    params.permit(:title)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def add_user_params
    params[:user_id]
  end

end
