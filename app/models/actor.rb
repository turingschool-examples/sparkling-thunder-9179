class Actor < ApplicationRecord
  belongs_to :movie

  def sort_age
    Actor.order(age: :desc)
  end

  def self.average_age
    average(:age)
  end
end