class CreateActorsMoviesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :actor_movies, id: false do |t|
      t.belongs_to :actor
      t.belongs_to :movie
  end
end
end
