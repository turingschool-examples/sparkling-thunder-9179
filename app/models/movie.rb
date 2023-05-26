class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movies_actors
  has_many :actors, through: :movies_actors 

  #instance methods
  def sort_young_age
    actors.order(age: :asc)
  end

  def average_actor_age
    actors.average(:age)
  end

  

end
