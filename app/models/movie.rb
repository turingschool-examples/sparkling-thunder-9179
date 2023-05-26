class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def self.sort_actors(movie)
    movie.actors.order(:age)
  end
end
