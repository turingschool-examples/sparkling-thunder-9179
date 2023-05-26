class MovieActorsController < ApplicationController
  def create
    MovieActor.create!(movie_actor_params)
    redirect_to "/movies/#{params[:movie_id]}"
  end

  private
  def movie_actor_params
    params.permit(:movie_id, :actor_id)
  end
end