class TasksController < ApplicationController

  def new
    @task = Task.new(list_id: params[:list_id])
  end

  def create
    Task.create(task_params)
    redirect_to list_path(params[:task][:list_id])
  end

  private

  def task_params
    params.require(:task).permit(:content, :list_id)
  end


end
