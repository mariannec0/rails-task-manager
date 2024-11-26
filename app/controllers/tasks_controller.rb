class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def new_record?
    !persisted?
  end

  def persisted?
    id.present? && !destroyed?
  end

  def new
    @task = Task.new
    @task.new_record?
    @task.persisted?
    @task.destroyed?
  end

  def show
    # @task = Task.find(params[:id])
  end

  def create
    @task = Task.create(task_params)
    redirect_to task_path(@task)
    @task.new_record?
    @task.persisted?
    @task.destroyed?
  end

  def edit
    # @task = Task.find(params[:id])
  end

  def update
    # @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    # @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other
    @task.new_record?
    @task.persisted?
    @task.destroyed?
  end

  private
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
