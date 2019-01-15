class TodosController < ApplicationController

  #before_action :todo_params, only: [:show]
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save 
      flash.notice = "Task created: #{@todo.task}"
      redirect_to todos_path
    else 
      # if validation in model fails => we want to render a new form
      render 'new'
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
