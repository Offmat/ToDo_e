class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
  end

  def show
  end

  def new
    @tasks = Task.new
  end
end
