class ActorsMovies < ApplicationRecord
  belongs_to :movies
  belongs_to :actors
end