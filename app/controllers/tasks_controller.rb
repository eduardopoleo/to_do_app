class TasksController < ApplicationController

  before_action :set_project
  before_action :current_user
  before_action :require_user
  before_action :set_task, only: [:erase, :check, :edit, :update]

  def create
    @task = @project.tasks.build(set_params)
    @task.user_id = @current_user.id
    @task.save
  
    respond_to do |format|

      format.html do 
        if @task.valid?
          flash[:notice] = "Your task has been successfully created"
          redirect_to project_path(@project)
        else
          render 'projects/show'
        end
      end 

      format.js 
    end
  end

  def erase
    @task.erased = params[:erase]
    @task.save

    respond_to do |format|
      format.html{redirect_to project_path(@project)}
      format.js
    end
  end

  def check
    @task.checked = params[:checked]
    @task.save
    
    respond_to do |format|
      format.html{redirect_to project_path(@project)}
      format.js
    end
  end
  

  def edit
    
  end

  def update
    if @task.update(set_params)
      flash[:success] = "Your task has been successfully updated"
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end



  private
  def set_params
    params.require(:task).permit!
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end
end