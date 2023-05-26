class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.find(params[:id])
    @actor = Actor.find_by(id: params[:actor_id])
    @movie.actors << @actor
    redirect_to "/movies/#{@movie.id}"
  end
end