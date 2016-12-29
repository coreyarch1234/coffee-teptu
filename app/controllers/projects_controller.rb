class ProjectsController < ApplicationController
  def index
  end

  def show
  end

  def new
      @user = User.find(params[:user_id])
      @project = Project.new
  end

  def create
      @user = User.find(params[:user_id])
      @project = @user.projects.new(project_params)
      if @project.save
        #   redirect to the user show controller
        redirect_to(controller: "users", action: "show", id: @project.id)
      else
        #   redirect new project form
      end
  end

  def edit
  end

  def update
  end

  def project_params
     params.require(:project).permit(:title, :description, :tools)
 end

end
