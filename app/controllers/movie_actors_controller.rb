class MovieActorsController < ApplicationController
  def create
    movie = Movie.find(params[:id])
    actor = Actor.find(params[:actor_id])
    MovieActor.create!(movie_actor_params)
    redirect_to "/movies/#{movie.id}"
  end

  private
  def movie_actor_params
    params.permit(:movie_id, :actor_id)
  end
end