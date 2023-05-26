require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it {should belong_to :studio}
    it {should have_many :actors}
  end

  describe "instance methods" do
    describe "#young_to_old" do
    let!(:studio_1) { Studio.create!(name:"Paramount", location: "Los Angeles") }
    let!(:movie_1) { studio_1.movies.create!(title:"Billy Madison", creation_year: "1994", genre:"Comedy") }
    let!(:movie_2) { studio_1.movies.create!(title:"Happy Gilmore", creation_year: "1995", genre:"Comedy") }
    let!(:movie_3) { studio_1.movies.create!(title:"Liar, Liar", creation_year: "1997", genre:"Dramaedy") }
    let!(:actor_1) { movie_1.actors.create!(name:"Adam Sandler", age:51) }
    let!(:actor_2) { movie_1.actors.create!(name:"Steve Buchemi", age:62) }
    let!(:actor_3) { movie_2.actors.create!(name:"Christopher Macdonald", age:65) }
    let!(:actor_4) { movie_2.actors.create!(name:"Bob Barker", age:99) }
    let!(:actor_5) { movie_3.actors.create!(name:"Jim Carrey", age:30) }
    let!(:actor_6) { movie_3.actors.create!(name:"kid actor", age:12) }

      it "returns list of actors from youngest to oldest" do
        expect(movie_1.young_to_old_actors).to eq([actor_1, actor_2])
        expect(movie_3.young_to_old_actors).to eq([actor_6, actor_5])
        expect(movie_2.young_to_old_actors).to eq([actor_3, actor_4])
      end
    end
  end
end
