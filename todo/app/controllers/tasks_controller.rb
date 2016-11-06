class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :toggle_status]

  def index
    @tasks = Task.all.order(:priority).page(params[:page])
  end

  def show
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
      else
        format.html { render :edit }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_path, notice: 'Task was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @task.destroy
    redirect_to @task, notice: "Todo item delete"
  end

  def toggle_status
    if @task.resolved?
      @task.update_attribute(:status, 0)
    else
      @task.update_attribute(:status, 2)
    end
    redirect_to tasks_path, notice: "Todo item resolved"
  end


  private
  def set_task
    @task = Task.find(params[:id])
  end


  def task_params
    params.require(:task).permit(:title, :priority, :status)
  end

end
