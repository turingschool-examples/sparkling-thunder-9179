class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def age_sort
    actors.order(:age)
  end

  def average_age
    actors.average(:age).to_f.round
  end
end
