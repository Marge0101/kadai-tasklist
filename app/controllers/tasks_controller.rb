class TasksController < ApplicationController
  
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all
  end

  def show
   set_task
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'タスク が登録されました。がんばって！'
      redirect_to @task
    else
      flash.now[:danger] = 'タスク が登録できませんでした。もう一度お願いします。'
      render :new
    end
  end
 
  def edit
     set_task
  end

  def update
     set_task
     
     if @task.update(task_params)
      flash[:success] = 'タスク は更新されました'
      redirect_to @task
     else
      flash.now[:danger] = 'タスク は更新されませんでした'
      render :edit
     end
  end

  def destroy
     
     set_task
     @task.destroy

    flash[:success] = 'タスク は削除されました'
    redirect_to tasks_url
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:content)
  end
  
end
