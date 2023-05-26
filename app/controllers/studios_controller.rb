class StudiosController < ApplicationController
  def index
    @studio = Studio.all
    
  end

  def show
    @studio = Studio.find(params[:id])

  end
end