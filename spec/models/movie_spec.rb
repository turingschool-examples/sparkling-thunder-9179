require "rails_helper"

RSpec.describe Movie, type: :model do
  let!(:warner) { Studio.create!(name: "Warner Bros", location: "Culver City, CA") }

  let!(:ace) { warner.movies.create!(title: "Ace Ventura Pet Detective", creation_year: "1994", genre: "Comedy") }

  let!(:cox) { Actor.create!(name: "Courteney Cox", age: 26) }
  let!(:dan) { Actor.create!(name: "Dan Marino", age: 33) }
  let!(:jim) { Actor.create!(name: "Jim Carrey", age: 25) }
  let!(:sean) { Actor.create!(name: "Mary Sean Young", age: 30) }
  let!(:tone) { Actor.create!(name: "Tone Loc", age: 35) }
  
  let!(:mov_act1) { MovieActor.create!(movie_id: ace.id, actor_id: jim.id ) }
  let!(:mov_act2) { MovieActor.create!(movie_id: ace.id, actor_id: cox.id ) }
  let!(:mov_act3) { MovieActor.create!(movie_id: ace.id, actor_id: dan.id ) }
  let!(:mov_act4) { MovieActor.create!(movie_id: ace.id, actor_id: sean.id ) }
  let!(:mov_act5) { MovieActor.create!(movie_id: ace.id, actor_id: tone.id ) }

  describe "relationships" do
    it {should belong_to :studio}
    it {should have_many :movie_actors}
    it {should have_many(:actors).through(:movie_actors)}
  end

  describe "instance methods" do

    it '#ordered_age' do

    expect(ace.ordered_age).to eq([jim, cox, sean, dan, tone])
    end
    
    it '#avg_age' do

    expect(ace.avg_age.round).to eq(30)
    end
  end
end
