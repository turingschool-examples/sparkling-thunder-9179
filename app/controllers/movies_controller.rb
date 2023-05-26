class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors
    @actors_age =  @actors.sort_age
  end

  def new
  end

  def create
    @movie = Movie.find(params[:id])
    actor = @movie.actors.create(actor_params)
    redirect_to "/movies/#{@movie.id}"
  end

  private
    def actor_params
      params.permit(:name, :age)
    end
end