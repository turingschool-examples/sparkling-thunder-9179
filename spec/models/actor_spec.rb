require "rails_helper"

RSpec.describe Actor, type: :model do
  describe "relationships" do
    it {should belong_to :movie}
  end
  describe "instance methods" do
    it "sort_age" do
      studio_1 = Studio.create!(name: "LucasArts", location: "LA")
      movie_1 = studio_1.movies.create!(title: "StarWars", creation_year: "1977", genre: "Scifi")
      @actor_1 = movie_1.actors.create!(name: "Mark Hamil", age: 26)
      @actor_2 = movie_1.actors.create!(name: "Harrison Ford", age: 35)
      @actor_3 = movie_1.actors.create!(name: "Carrie Fisher", age: 21)

      expect(Actor.sort_age).to eq([@actor_3, @actor_1, @actor_2])
    end
    it "average_age" do
      studio_1 = Studio.create!(name: "LucasArts", location: "LA")
      movie_1 = studio_1.movies.create!(title: "StarWars", creation_year: "1977", genre: "Scifi")
      @actor_1 = movie_1.actors.create!(name: "Mark Hamil", age: 26)
      @actor_2 = movie_1.actors.create!(name: "Harrison Ford", age: 35)
      @actor_3 = movie_1.actors.create!(name: "Carrie Fisher", age: 21)

      expect(Actor.average_age).to eq(27.33)
    end
  end

end