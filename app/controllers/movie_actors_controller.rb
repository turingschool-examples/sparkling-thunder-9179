class MovieActorsController < ApplicationController
  def create
    movie = Movie.find(params[:movie_id])
    movie_actor = MovieActor.create!(mov_act_params)

    redirect_to "/movies/#{movie.id}"
  end

  private
  def mov_act_params
    params.permit(:actor_id, :movie_id)
  end
end