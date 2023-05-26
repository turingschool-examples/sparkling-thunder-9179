class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors
    @actors_age =  @actors.sort_age

  end
end