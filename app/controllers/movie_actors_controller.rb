class MovieActorsController < ApplicationController
  def create
    movie = Movie.find(params[:movie_id])
    MovieActor.create!(movie_id: params[:movie_id], actor_id: params[:actor_id])
    redirect_to "/movies/#{movie.id}"
    
  end
end