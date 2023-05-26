class Movie < ApplicationRecord
  belongs_to :studio
  has_and_belongs_to_many :actors

  def youngest_actor 
    actors.order(:age).pluck(:name)
  end

  def average_age_of_actors
    actors.average(:age)
  end
end
