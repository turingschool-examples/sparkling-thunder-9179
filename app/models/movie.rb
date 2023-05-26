class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def actors_ordered_by_name_age
    actors.order(name: :asc, age: :asc)
  end

  def average_actor_age
    actors.average(:age).to_f.round(1)
  end
end
