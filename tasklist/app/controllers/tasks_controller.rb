class TasksController < ApplicationController
  before_action :set_task, only: [:show,:edit,:update,:destroy]
  
  def index
    @tasks = Task.all.page(params[:page]).per(15)
  end
  
  def show
  end
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'タスクが正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = "タスクが投稿されませんでした"
      render :new
    end
  end
  
  def new
    @task = Task.new
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      flash[:succes] = "タスクが更新されました。"
      redirect_to @task
    else
      flash.now[:danger] ="タスクが更新されませんでした。"
      render :new
    end
  end
  
  def destroy
    @task.destroy
    flash[:succes] = "タスクが更新されました。"
    redirect_to tasks_url
    
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
end