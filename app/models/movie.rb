class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def young_to_old_actors
    actors.order(:age)
  end

  def av_age_actors
    actors.average(:age)
  end
end
