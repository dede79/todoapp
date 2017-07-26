class TodosController < ApplicationController
  
  def index
    @todos= Todo.all.order("created_at desc")
  end
  
  def create
    @todo=Todo.create!(todo_params)
  end
  
  def update
    @todo = Todo.find(params[:id])
    @todo.update!(todo_params)
  end

  def destroy
    @todo = Todo.find(params[:id]).destroy!
    respond_to do |format|
      format.js
    end
  end
  
  
  private
  def todo_params
    params.require(:todo).permit(:title)
  end

end
