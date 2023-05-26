class AddActorsToMovies < ActiveRecord::Migration[7.0]
  def change
    add_reference :movies, :movie, null: false, foreign_key: true
  end
end
