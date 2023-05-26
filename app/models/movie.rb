class Movie < ApplicationRecord
  belongs_to :studio
  has_many :unions
  has_many :actors, through: :unions
end
