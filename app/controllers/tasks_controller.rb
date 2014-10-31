class TasksController < ApplicationController

  before_action :set_project
  before_action :set_task, only: [:erase, :check]

  def create
    @task = @project.tasks.build(set_params)
    @task.save
  
    respond_to do |format|

      format.html do 
        if @task.valid?
          flash[:notice] = "Your task has been successfully saved"
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
    redirect_to project_path(@project)
  end

  def check
    @task.checked = params[:checked]
    @task.save
    redirect_to project_path(@project)
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