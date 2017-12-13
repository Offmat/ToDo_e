class TasksController < ApplicationController
  def index
    @tasks = Task.all.order('created_at desc')
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task
    else
      render 'create'
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :body)
  end
end
