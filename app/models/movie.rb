class Movie < ApplicationRecord
  belongs_to :studio
  has_many :casts
  has_many :actors, through: :casts

  def actors_by_age
    actors.order(age: :asc)
  end

  def average_actor_age
    actors.sum(:age) / actors.count
  end
end
