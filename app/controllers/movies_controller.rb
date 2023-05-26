class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors_ordered_by_name_age
    @average_age = @movie.average_actor_age
  end
end