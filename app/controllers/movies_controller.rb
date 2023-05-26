class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.order_age
  end

  def new

  end

  def create
    
  end
end