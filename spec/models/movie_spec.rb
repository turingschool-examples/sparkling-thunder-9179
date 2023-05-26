require "rails_helper"

RSpec.describe Movie, type: :model do
  before :each do 
    @studio1 = Studio.create!(name: "Mountain Max", location: "Colorado")
    @studio2 = Studio.create!(name: "Ocean Max", location: "California")

    @movie1 = @studio1.movies.create!(title: "Going Hiking", creation_year: "1900", genre: "outdoor")
    @movie2 = @studio1.movies.create!(title: "Wanda Goes Barking", creation_year: "2023", genre: "puppies")
    @movie3 = @studio2.movies.create!(title: "Wanda VS The Vacuum", creation_year: "2022", genre: "super hero")
    @movie4 = @studio2.movies.create!(title: "Driving I70", creation_year: "2000", genre: "action")

    @actor1 = @movie3.actors.create!(name: "Tom Cruise", age: 75)
    @actor2 = @movie3.actors.create!(name: "Wanda", age: 6)
  end
  describe "relationships" do
    it {should belong_to :studio}
    it {should have_many :casts}
    it {should have_many(:actors).through(:casts)}
  end

  describe "class methods" do
    it "actors_by_age" do
      expect(@movie3.actors_by_age).to eq([@actor2, @actor1])
    end
    
    it "average_actor_age" do
      expect(@movie3.average_actor_age).to eq(40)
    end
  end
end
