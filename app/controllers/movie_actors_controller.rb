class MovieActorsController < ApplicationController
  def create
    movie = Movie.find(params[:id])
    actor = Actor.find(params[:actor_id])

    movie.actors << actor
    redirect_to "/movies/#{movie.id}"
  end
end