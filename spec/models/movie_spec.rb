require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it {should belong_to :studio}
    it {should have_many :movie_actors}
    it {should have_many(:actors).through(:movie_actors)}
  end
  before :each do
    @studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
    @studio_2 = Studio.create!(name: "Disney", location: "Florida")

    @movie_1 = @studio_1.movies.create!(title: "Speed", creation_year: "1996", genre: "Action")
    @movie_2 = @studio_1.movies.create!(title: "Matrix", creation_year: "1999", genre: "Scifi")
    @movie_3 = @studio_2.movies.create!(title: "Avengers", creation_year: "2006", genre: "Adventure")

    @actor_1 = Actor.create!(name:"Keanu Reeves", age: 38)
    @actor_2 = Actor.create!(name: "Sandra Bullock", age: 22)
    @actor_3 = Actor.create!(name: "Chris Evans", age: 32)
    
    MovieActor.create!(movie_id: @movie_1.id, actor_id: @actor_1.id)
    MovieActor.create!(movie_id: @movie_1.id, actor_id: @actor_2.id)
    MovieActor.create!(movie_id: @movie_3.id, actor_id: @actor_1.id)
    MovieActor.create!(movie_id: @movie_3.id, actor_id: @actor_3.id)
  end
  describe '#instance_methods' do
    describe '#young_to_old_actors' do
        it 'arranges the actors from youngest to oldest' do
          expect(@movie_1.young_to_old_actors).to eq([@actor_2, @actor_1])
        end
      end
    describe '#av_age_actors' do
      it 'gives the average age of the actors in the movie' do
        expect(@movie_1.av_age_actors).to eq(30)
      end
    end
  end
end
