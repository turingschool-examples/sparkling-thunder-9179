require "rails_helper"

RSpec.describe Studio, type: :model do
  let!(:studio1) {Studio.create!(name: "Univeral Studios", location: "Hollywood")}
  
  let!(:matrix) {studio1.movies.create!(title: "The Matrix", creation_year: 1999, genre: "Action")}
  let!(:speed) {studio1.movies.create!(title: "Speed", creation_year: 1994, genre: "Action")}
  let!(:always) {studio1.movies.create!(title: "Always Be My Maybe", creation_year: 2019, genre: "Rom Com")}

  let!(:keanu) {Actor.create!(name: "Keanu Reeves", age: 58)}
  let!(:laurence) {Actor.create!(name: "Laurence Fishburne", age: 61)}
  let!(:carrie) {Actor.create!(name: "Carrie-Anne Moss", age: 55)}
  let!(:sandra) {Actor.create!(name: "Sandra Bullock", age: 58)}
  let!(:ali) {Actor.create!(name: "Ali Wong", age: 41)}

  

  describe "relationships" do
    it {should have_many :movies}
  end

  describe "EXT1 Studio's Actors" do
    it "creates a unique list of all of the actors that have worked on any of this studio's movies." do
    matrix.actors << [keanu,laurence,carrie]
    speed.actors << [keanu, sandra]
    always.actors << [keanu, ali]

    expect(studio1.actors_worked).to match_array([keanu, laurence, carrie, sandra, ali])
    end
  end
end
