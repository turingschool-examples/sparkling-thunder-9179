class Movie < ApplicationRecord
  belongs_to :studio

  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def actor_age_sorted
    actors.order(:age)
  end
end
