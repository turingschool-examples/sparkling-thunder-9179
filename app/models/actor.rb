class Actor < ApplicationRecord
  has_many :unions
  has_many :movies, through: :unions
end