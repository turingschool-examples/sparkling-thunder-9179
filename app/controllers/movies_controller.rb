class MoviesController < ApplicationController
  def show
    @film = Movie.find(params[:id])
  end
end