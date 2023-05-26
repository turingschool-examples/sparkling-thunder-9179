require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it {should belong_to :studio}
    it {should have_many :actor_movies}
    it {should have_many(:actors).through(:actor_movies)}
  end

  before :each do
    test_data
  end

  describe "class methods" do
    it "can calculate average age of actors in movie" do
      expect(@movie_1.average_age.round(2)).to eq(75.5)
      expect(@movie_2.average_age.round(2)).to eq(63.0)
    end

    it "can list actors in movie by age" do
      expect(@movie_1.actors_by_age).to eq([@actor_2, @actor_1])
      expect(@movie_2.actors_by_age).to eq([@actor_3, @actor_4])
    end
  end
end
