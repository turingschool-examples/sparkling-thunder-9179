class MovieActorsController <ApplicationController
  def create
    movie = Movie.find(params[:movie_id])
    movie_actor = MovieActor.create!(movie_actor_params)
    redirect_to "/movies/#{movie.id}"
  end

  private
  def movie_actor_params
    params.permit(:actor_id, :movie_id)
  end
end