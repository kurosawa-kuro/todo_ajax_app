# app/controllers/todos_controller.rb
class TodosController < ApplicationController
  def index
    @todos = Todo.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @todos }
    end
  end

  def show
    @todo = Todo.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @todo }
    end
  end

  def create
    @todo = Todo.new(todo_params)
    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_path }
        format.json { render json: @todo, status: :created, location: @todo }
      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title)
  end
end
