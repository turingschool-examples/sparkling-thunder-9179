require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it {should belong_to :studio}
    it {should have_many :actor_movies }
    it {should have_many(:actors).through(:actor_movies)}
  end

  describe "instance methods" do
    let!(:studio1) {Studio.create!(name: "Universal Studios", location: "Hollywood")}
    let!(:movie1) {studio1.movies.create!(title: "Toy Story", creation_year: "1995", genre: "animation")}
    
    let!(:studio2) {Studio.create!(name: "Max Studios", location: "London")}
    let!(:movie2) {studio2.movies.create!(title: "The Land of Things", creation_year: "2054", genre: "stop motion")}
    let!(:movie3) {studio2.movies.create!(title: "History of Things", creation_year: "2000", genre: "live action")}
    
    let!(:actor1) {Actor.create!(name: "Meryl Streep", age: 73)}
    let!(:actor2) {Actor.create!(name: "Betty White", age: 89)}
    let!(:actor3) {Actor.create!(name: "Major Tom", age: 27)}

    let!(:actmov1) {ActorMovie.create!(actor_id: actor1.id, movie_id: movie1.id)}
    let!(:actmov2) {ActorMovie.create!(actor_id: actor3.id, movie_id: movie1.id)}

    let!(:actmov3) {ActorMovie.create!(actor_id: actor2.id, movie_id: movie2.id)}
    
    describe "#actor_age_sorted" do
      it "lists the actors from youngest to oldest" do
        expect(movie1.actor_age_sorted).to eq([actor3, actor1])
      end
    end
  end
end
