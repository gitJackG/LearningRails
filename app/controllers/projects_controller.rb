class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.where("LOWER(title) = ?", params[:title].downcase).first
  end
end
