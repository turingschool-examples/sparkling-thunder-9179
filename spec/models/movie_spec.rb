require "rails_helper"

RSpec.describe Movie, type: :model do
  
  before(:each) do
    @uni = Studio.create!(name: "Universal Studios", location: "Hollywood")
    
    @good = @uni.movies.create!(title: "Goodwill Hunting", creation_year: "1992", genre: "drama")

    @tom = Actor.create!(name: "Tom Hanks", age: 65)
    @matt = Actor.create!(name: "Matt Damon", age: 58)
    @will = Actor.create!(name: "Will Smith", age: 54)

    @good_matt = MoviesActor.create!(movie: @good, actor: @tom)
    @toy_tom = MoviesActor.create!(movie: @good, actor: @matt)
    @mib_will = MoviesActor.create!(movie: @good, actor: @will)

  end


  describe "relationships" do
    it {should belong_to :studio}
    it {should have_many :movies_actors}
    it {should have_many(:actors).through(:movies_actors)}
  end

  describe "instance methods" do
    describe "#sort_young_age" do 
      it "sorts a movie's actors by youngest age" do 
        expect(@good.sort_young_age).to eq([@will, @matt, @tom])
      end
    end

    describe "#average_actor_age" do 
      it "calculates the average age of actors in a movie" do 
        expect(@good.average_actor_age.round).to eq(59)
      end
    end
  end
end
