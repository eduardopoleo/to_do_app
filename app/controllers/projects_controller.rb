class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :erase]
  before_action :current_user
  before_action :require_user
  before_action :require_same_user, only: [:show, :edit, :update]

  def index
    @project = Project.new
    @projects = @current_user.projects.order(created_at: :desc)
  end

  def new
    @project = Project.new
  end

  def show
    @task = Task.new
  end

  def create
    @project = Project.new(set_params)
    @project.user_id = @current_user.id
    @project.save

    respond_to do |format|

      format.html do 
        if @project.valid?
          flash[:success] = "Your task has been successfully created"
          redirect_to projects_path
        else
          render "index"
        end
      end
      format.js
    end
  end

  def edit
  end

  def update

    if @project.update(set_params)
      flash[:success] = "Your project have been successfully updated"
      redirect_to projects_path
    else
      render 'edit'
    end
  end

  def erase
    @project.erased = true
    @project.save

    respond_to do |format|
      format.html{redirect_to projects_path}
      format.js
    end
    
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def set_params
    params.require(:project).permit(:title, :description, :category)
  end

  def require_same_user
    if logged_in? && current_user != @project.user
      flash[:error] = 'Your are not allowed to do that!'
      redirect_to projects_path
    end
  end

end