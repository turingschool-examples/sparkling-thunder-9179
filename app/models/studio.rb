class Studio < ApplicationRecord
  has_many :movies

  def self.actors
    Actor.joins(movies: :studio).where(studios: { name: "Universal Studios" }).distinct
  end
end
