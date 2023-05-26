class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors.order(age: :asc)
    @average_age = @actors.average(:age)
    @available_actors = Actor.where.not(id: @movie.actors.pluck(:id))
  end
end