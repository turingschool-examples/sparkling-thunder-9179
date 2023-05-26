class Actor < ApplicationRecord
  belongs_to :movie

  def self.sort_age
    order(age: :asc)
  end

  def self.average_age
    average(:age)
  end
end