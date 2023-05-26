class MoviesController < ApplicationController 
  def show
    @studios = Studio.all
  end

end