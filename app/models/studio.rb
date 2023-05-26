class Studio < ApplicationRecord
  has_many :movies

  def unique_actors
    Studio.joins(movies: [{movie_actors: :actors}]).order(:name).distinct
  end
end
