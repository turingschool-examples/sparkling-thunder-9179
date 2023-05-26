class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors_ordered_by_name_age
    @average_age = @movie.average_actor_age
  end

  def update
    @movie = Movie.find(params[:id])
    actor = Actor.find(params_permit[:actor_id])
    @movie.actors << actor
    redirect_to "/movies/#{@movie.id}"
  end

  private

  def params_permit
    params.permit(:title, :creation_year, :genre, :actor_id)
  end
end