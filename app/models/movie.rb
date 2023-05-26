class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actors

  def average_age
    actors.average(:age)
  end

  def sort_actors_by_age
    actors.order(:age)
  end
end
