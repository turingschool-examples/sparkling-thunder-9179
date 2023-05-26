require "rails_helper"

RSpec.describe Movie, type: :model do
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
    it {should belong_to :studio}
    it { should have_many(:movie_actors)}
    it { should have_many(:actors).through(:movie_actors)}
  end

  describe "US2 list of all its actors from youngest to oldest." do
    it ".orders_actors_by_age" do

      matrix.actors << [keanu,laurence,carrie]

      expect(matrix.orders_actors_by_age).to eq([carrie, keanu, laurence])
    end

    describe "US2 calculates average age of actors." do
      it ".average_age" do
        
        matrix.actors << [keanu,laurence,carrie]
  
        expect(matrix.average_age).to eq(58)
      end
    end
  end
end