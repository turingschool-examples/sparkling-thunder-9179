class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actors

  def young_to_old_actors
    actors.order(age: :asc)
  end

  def average_age
    actors.average(:age)
  end
end
