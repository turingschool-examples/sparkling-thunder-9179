class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actors, through: :actors_movies

  def average_age
    actors.average(:age)
  end

  def sort_by_age
    actors.order(:age)
  end
end
