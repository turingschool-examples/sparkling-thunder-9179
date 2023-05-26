class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def av_actor_age
    actors.average(:age)
  end

  def order_actor_name
    actors.order(:name)
  end
end
