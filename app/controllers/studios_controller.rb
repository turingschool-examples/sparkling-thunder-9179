class StudiosController < ApplicationController
  def index
    @studios = Studio.includes(:movies).all
  end
end