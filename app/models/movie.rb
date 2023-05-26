class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movies_actors
  has_many :actors, through: :movies_actors   
end
