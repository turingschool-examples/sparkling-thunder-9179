class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @sorted_movie_actors = @movie.actors_youngest_to_oldest
  end
end