class Studio < ApplicationRecord
  has_many :movies

  def actors_worked
    
    Actor.joins(:movie_actors, :movies).where(movies: {studio_id: self.id}).distinct
    #solution returns actors string names
    # Movie.joins(:movie_actors, :actors).distinct.pluck(:name)
  end
end
