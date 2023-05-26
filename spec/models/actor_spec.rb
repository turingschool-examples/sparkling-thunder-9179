require "rails_helper"

RSpec.describe Actor, type: :model do
  describe "relationships" do
    it { should have_many :movie_actors }
    it { should have_many(:movies).through(:movie_actors)}
  end

  describe "#class methods" do
    describe "#order_by_age" do
      it "can order an array of actors by age" do
        studio_1 = Studio.create!(name: "Big Production", location: "New York")

        movie_1 = studio_1.movies.create!(title: "Tootles!", creation_year: "1990", genre: "RomCom")
        movie_2 = studio_1.movies.create!(title: "Heartbreaker", creation_year: "2000", genre: "Drama")
  
        actor_1 = movie_1.actors.create!(name: "Buzz Boy", age: 55)
        actor_2 = movie_1.actors.create!(name: "Lizzy McAlpine", age: 25)
        actor_3 = movie_1.actors.create!(name: "Starlight Starbright", age: 130)

        original = [actor_1, actor_2, actor_3]
        expected = [actor_2, actor_1, actor_3]

        expect(Actor.all).to eq(original)
        expect(Actor.order_by_age).to eq(expected)
      end
    end

    describe "#average_age" do
      it "can return the average age of all actors in an array" do
        studio_1 = Studio.create!(name: "Big Production", location: "New York")

        movie_1 = studio_1.movies.create!(title: "Tootles!", creation_year: "1990", genre: "RomCom")
        movie_2 = studio_1.movies.create!(title: "Heartbreaker", creation_year: "2000", genre: "Drama")
  
        actor_1 = movie_1.actors.create!(name: "Buzz Boy", age: 55)
        actor_2 = movie_1.actors.create!(name: "Lizzy McAlpine", age: 25)
        actor_3 = movie_1.actors.create!(name: "Starlight Starbright", age: 130)

        expected = 70

        expect(Actor.average_age).to eq(expected)
      end
    end
  end
end