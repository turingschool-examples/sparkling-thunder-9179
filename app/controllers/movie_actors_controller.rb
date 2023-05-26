class MovieActorsController < ApplicationController
  def create 
    actor = Actor.where(id: params[:actor_id])[0]
    movie = Movie.where(id: params[:movie_id])[0]
    MovieActor.create!(actor: actor, movie: movie)
    redirect_to "/movies/#{movie.id}"
  end
end