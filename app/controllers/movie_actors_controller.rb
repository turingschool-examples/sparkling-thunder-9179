class MovieActorsController < ApplicationController
  def create
    movie_actor = MovieActor.create!(movie_actor_params)
    redirect_back fallback_location: "/studios"
  end

  private
    def movie_actor_params
      params.permit(:movie_id, :actor_id)
    end
end