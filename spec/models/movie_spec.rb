require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it {should belong_to :studio}
    it {should have_many(:actors).through(:movie_actors) }
  end

  describe "instance methods" do
    before(:each) do
      @studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
      @movie_1 = @studio_1.movies.create!(title: "Jurassic Park", creation_year: "1995", genre: "action")
      @movie_2 = @studio_1.movies.create!(title: "Oppenheimer", creation_year: "2023", genre: "puzzle")

      @studio_2 = Studio.create!(name: "Pixar", location: "Brea")
      @movie_3 = @studio_2.movies.create!(title: "Toy Story", creation_year: "1995", genre: "animation")
      @movie_4 = @studio_2.movies.create!(title: "Inside Out", creation_year: "2015", genre: "animation")

      @actor_1 = Actor.create!(name: "Tom Hanks", age: 62)
      @actor_2 = Actor.create!(name: "Meryl Streep", age: 73)
      @actor_3 = Actor.create!(name: "Brad Pitt", age: 55)

      @movie_actor_1 = MovieActor.create!(movie_id: @movie_1.id, actor_id: @actor_1.id)
      @movie_actor_2 = MovieActor.create!(movie_id: @movie_1.id, actor_id: @actor_2.id)
      @movie_actor_3 = MovieActor.create!(movie_id: @movie_1.id, actor_id: @actor_3.id)
    end

    context "#sort_by_age" do
      it "sorts a movies actors by age" do
        expect(@movie_1.actors_youngest_to_oldest).to eq([@actor_3, @actor_1, @actor_2])
      end
    end

    context "#average" do
      it "sorts a movies actors by age" do
        expect(@movie_1.actors_average_age.round(2)).to eq(63.33)
      end
    end
  end
end
