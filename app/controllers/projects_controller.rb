class ProjectsController < ApplicationController
  def index
  end

  def show
      @user = current_user
      @project = current_user.projects
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.new(project_params)

      if @project.save
        #   redirect to the user show controller
        redirect_to(controller: "users", action: "show", id: @project.id)
      else
        #   redirect new project form
        flash[:notice] = "Fill in all fields"
        redirect_to(new_user_project_path)
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
