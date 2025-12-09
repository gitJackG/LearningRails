class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]
  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = "Project was successfully created."
      redirect_to project_path(@project), notice: "Project was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      flash[:notice] = "Project was successfully updated."
      redirect_to project_path(@project), notice: "Project was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy!
    flash[:notice] = "Project was successfully destroyed."
    redirect_to projects_path, status: :see_other
  end

  private
    def set_project
      @project = Project.friendly.find(params.expect(:id))
    end

    def project_params
      params.expect(project: [ :title ])
    end
end
