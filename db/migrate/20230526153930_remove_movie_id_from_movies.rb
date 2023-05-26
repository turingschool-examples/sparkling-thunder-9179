class RemoveMovieIdFromMovies < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :movie_id, :bigint 
  end
end
