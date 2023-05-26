class ActorMoviesController < ApplicationController
  def create
    # binding.pry
    actor_movie = ActorMovie.create!(actor_id: params[:actor_id], movie_id: params[:id])
    movie = Movie.find_by(id: actor_movie.movie_id)
    redirect_to "/movies/#{movie.id}"
  end
end