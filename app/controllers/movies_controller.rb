class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @movie_actors = Movie.sort_actors(@movie)
  end
end
