class Casts::MoviesController < ApplicationController
  def create
    @film = Movie.find(params[:id])
    @cast_member = Cast.create!(movie_id: "#{@film.id}", actor_id: params[:actor_id])
    redirect_to "/movies/#{@film.id}"
  end
end