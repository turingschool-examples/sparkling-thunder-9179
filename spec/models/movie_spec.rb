require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it {should belong_to :studio}
    it {should have_many :movie_actors}
    it {should have_many(:actors).through(:movie_actors)}
  end

  describe "instance methods" do
    it "#actors_order_of_age" do
      studio_1 = Studio.create!(name: "Disney", location: "Burbank, CA")
      movie_1 = studio_1.movies.create!(title: "Star Wars", creation_year: "1972", genre: "Science Fiction")
      actor_1 = movie_1.actors.create!(name: "Harrison Ford", age: 50)
      actor_2 = movie_1.actors.create!(name: "Mark Hamill", age: 20)
      actor_3 = movie_1.actors.create!(name: "Carrie Fisher", age: 30)

      expect(movie_1.actors_order_of_age).to eq([actor_2, actor_3, actor_1])
    end

    it "#average_actor_age" do
      studio_1 = Studio.create!(name: "Disney", location: "Burbank, CA")
      movie_1 = studio_1.movies.create!(title: "Star Wars", creation_year: "1972", genre: "Science Fiction")
      actor_1 = movie_1.actors.create!(name: "Harrison Ford", age: 50)
      actor_2 = movie_1.actors.create!(name: "Mark Hamill", age: 20)
      actor_3 = movie_1.actors.create!(name: "Carrie Fisher", age: 30)

      expect(movie_1.average_actor_age.round).to eq(33)
    end
  end
end
