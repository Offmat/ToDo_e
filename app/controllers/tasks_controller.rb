class TasksController < ApplicationController
  def index
    @task = Task.new
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

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params) #wypróbować errory przy walidacji dla .attributes i dla .update
    redirect_to @task
  end

  def destroy
    @task = Task.find(params[:id])
    @task.delete
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:title, :body)
  end
end
