require "rails_helper"

RSpec.describe Movie, type: :model do
  before(:each) do 
    @studio_1 = Studio.create!(name: "Wolfie Productions", location: "Boulder, CO")
    @studio_2 = Studio.create!(name: "Juno Films", location: "Denver, CO")

    @movie_1 = @studio_1.movies.create!(title: "The dog chew", creation_year: "2022", genre: "Drama")
    @movie_2 = @studio_1.movies.create!(title: "How to catch a squirrel", creation_year: "2023", genre: "Action")
    
    @actor_1 = Actor.create!(age: 3, name: "Can Has Cheezburgr")                                          
    @actor_2 = Actor.create!(age: 6, name: "Sir Wiggles")                                          
    @actor_4 = Actor.create!( age: 0, name: "Brutus")                                          
    @actor_5 = Actor.create!(age: 5, name: "Mo")                                          
    @actor_6 = Actor.create!(age: 7, name: "Bacon")                                          
    @actor_7 = Actor.create!( age: 4, name: "Mrs. Doubtfire")  
    MovieActor.create!(movie: @movie_1, actor: @actor_1)
    MovieActor.create!(movie: @movie_1, actor: @actor_2)
    MovieActor.create!(movie: @movie_1, actor: @actor_4)
    MovieActor.create!(movie: @movie_1, actor: @actor_5)
    MovieActor.create!(movie: @movie_1, actor: @actor_6)

    MovieActor.create!(movie: @movie_2, actor: @actor_6)
    MovieActor.create!(movie: @movie_2, actor: @actor_7)
  end

  describe "relationships" do
    it {should belong_to :studio}
  end

  describe "instance methods" do 
    it "av_actor_age" do 
      expect(@movie_1.av_actor_age).to eq(4.2)
      expect(@movie_2.av_actor_age.round(2)).to eq(5.5)
    end
  end
end
