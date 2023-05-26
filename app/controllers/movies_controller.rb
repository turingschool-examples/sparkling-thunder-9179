class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @movie_actors = Movie.sort_actors(@movie)
  end

  def create
    movie = Movie.find(params[:id])
    redirect_to "/movies/#{movie.id}"
  end
end

# <%= actor.name %>