class Actor < ApplicationRecord
  belongs_to :movie, required: true 
  has_many :movies
end