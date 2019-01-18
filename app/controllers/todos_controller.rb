class TodosController < ApplicationController

  #before_action :todo_params, only: [:show]
  before_action :authenticate_user!, except: [:show, :index]

  def index
    if current_user
    @todos = current_user.todos
    else
      flash.notice = "You must be logged in to access content"
      redirect_to new_user_session_path
    end

  end

  def new
    @todo = current_user.todos.build
  end

  def create
    @todo = current_user.todos.build(todo_params)
    if @todo.save 
      flash.notice = "Task created: #{@todo.task}"
      redirect_to todos_path
    else 
      # if validation in model fails (e.g save method returns false) => we want to render a new form
      render 'new'
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update(todo_params)
    flash.notice = "Updated: #{@todo.task}"
    if @todo.update(todo_params)
      redirect_to todos_path
    end
  
  end

  def show
    @todo = Todo.find(params[:id])
    
  end
  
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    flash.notice = "Completed: #{@todo.task}"
    redirect_to todos_path
  end
  
  private

  def todo_params
    params.require(:todo).permit(:task)
  end
  

end
