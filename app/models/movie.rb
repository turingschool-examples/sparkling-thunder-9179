class Movie < ApplicationRecord
    has_many :actor_movies
    has_many :actors, through: :actor_movies
    belongs_to :studio
end
