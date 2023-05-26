class Studio < ApplicationRecord
  has_many :movies

  def actors_worked
    movies.joins(:movie_actors, :actors).distinct.pluck(:name)
  end
end
