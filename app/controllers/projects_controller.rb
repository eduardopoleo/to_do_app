class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update]
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    @task = Task.new
  end

  def create
    @project = Project.new(set_params)

    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def edit
  end

  def update

    if @project.update(set_params)
      flash[:success] = "Your project have been successfully updated"
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def set_params
    params.require(:project).permit(:title, :description)
  end

end