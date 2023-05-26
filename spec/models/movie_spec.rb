require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it {should belong_to :studio}
    it { should have_many :movie_actors }
    it { should have_many(:actors).through(:movie_actors) }
  end

  describe "class methods" do
    describe "#sort_actors" do
      it "sorts actors in a movie by age from youngest to oldest" do
        studio1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
        movie1 = studio1.movies.create!(title: "A Movie", creation_year: "2023", genre: "comedy")
        actor1 = movie1.actors.create!(name: "Sandra Bullock", age: 58)
        actor2 = movie1.actors.create!(name: "Meryl Streep", age: 73)
        actor3 = movie1.actors.create!(name: "Emma Watson", age: 33)
        expect(Movie.sort_actors(movie1)).to eq([actor3, actor1, actor2])
      end
    end
  end
end
