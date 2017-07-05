class TodosController < ApplicationController
  
  def index
    @todos= Todo.all.order("created_at desc")
  end
  
  def create
    @todo=Todo.create!(todo_params)
  end
  
  def update
  respond_to do |format|
    if @todo.update(todo_params)
      format.json { render :show, status: :ok, location: @todo }
    end
  end
end

  def destroy
    Todo.find(params[:id]).destroy!
  end
  
  
  private
  def todo_params
    params.require(:todo).permit(:title)
  end

end
