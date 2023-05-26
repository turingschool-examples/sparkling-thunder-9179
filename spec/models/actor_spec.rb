require "rails_helper"

RSpec.describe Actor, type: :model do
  describe "relationships" do
    it { should have_many :movie_actors }
    it { should have_many(:movies).through(:movie_actors)}
  end

  describe "#class methods" do
    describe "#order_by_age" do
      it "can order an array of actors by age" do
        studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")

        movie_1 = studio_1.movies.create!(title: "Toy Story", creation_year: "1995", genre: "Animation")
        movie_2 = studio_1.movies.create!(title: "Snowpiercer", creation_year: "2015", genre: "Action")

        actor_1 = movie_1.actors.create!(name: "Tom Cruize", age: 30)
        actor_2 = movie_1.actors.create!(name: "Keneau Reeves", age: 24)
        actor_3 = movie_1.actors.create!(name: "Chris Pratt", age: 27)

        expect(Actor.order_by_age).to eq([actor_2, actor_3, actor_1])
      end
    end

    describe "#average_age" do
      it "can return the average age of all actors in an array" do
        studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")

        movie_1 = studio_1.movies.create!(title: "Toy Story", creation_year: "1995", genre: "Animation")
        movie_2 = studio_1.movies.create!(title: "Snowpiercer", creation_year: "2015", genre: "Action")

        actor_1 = movie_1.actors.create!(name: "Tom Cruize", age: 30)
        actor_2 = movie_1.actors.create!(name: "Keneau Reeves", age: 24)
        actor_3 = movie_1.actors.create!(name: "Chris Pratt", age: 27)

        expect(Actor.average_age).to eq(27)
      end
    end
  end
end