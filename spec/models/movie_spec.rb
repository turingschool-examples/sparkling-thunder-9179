require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it {should belong_to :studio}
    it {should have_many :movie_actors}
    it {should have_many(:actors).through(:movie_actors) }
  end

  describe "instance methods" do
    describe "#alphabetize_actors" do
      it "organizes a movie's actors by age, ascending" do
        studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
        studio_2 = Studio.create!(name: "Janbarra Studios", location: "Somewhere Else")

        movie_1 = studio_1.movies.create!(title: "Wayne's World", creation_year: "1992", genre: "Amazing")
        movie_2 = studio_1.movies.create!(title: "Bill and Ted's Excellent Adventure", creation_year: "2000", genre: "Action")
        movie_3 = studio_2.movies.create!(title: "Passion of the Christ", creation_year: "1", genre: "Horror")

        actor_1 = Actor.create!(name: "Keanu", age: 132)
        actor_2 = Actor.create!(name: "Wayne", age: 34)
        actor_3 = Actor.create!(name: "Garth", age: 31)

        mov_act_1= MovieActor.create!(movie_id: movie_1.id, actor_id: actor_2.id)
        mov_act_2= MovieActor.create!(movie_id: movie_1.id, actor_id: actor_3.id)
        mov_act_3= MovieActor.create!(movie_id: movie_2.id, actor_id: actor_1.id)
        mov_act_4= MovieActor.create!(movie_id: movie_3.id, actor_id: actor_1.id)

        # I don't know what is going on. When I run movie_1.alphabetize_actors in pry I
        # get an array containing actor_3, then actor_2 (Garth then Wayne, what I'm expecting).
        # There must be something wrong with my method or something. I don't know why this
        # test is failing either.

        expect(movie_1.alphabetize_actors).to eq([@actor_3, @actor_2])

      end
    end
  end

end

