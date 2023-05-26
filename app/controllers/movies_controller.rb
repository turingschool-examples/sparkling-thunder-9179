class MoviesController < ApplicationController 
  
  def show 
    @movie = Movie.find(params[:id])
    @actors = @movie.actors 
  end

  def create
    @movie = Movie.find(params[:id])
    actor = Actor.find_by(id: params[:actor_id])

    if actor && !@movie.actors.include?(actor)
      @movie.actors << actor 
      redirect_to "/movies/#{@movie.id}"
    end
  end
end