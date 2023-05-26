require 'rails_helper'

RSpec.describe "studio index page" do
  before(:each) do
    @actor1 = Actor.create!(name: "Leo DiCap", age: "52")
    @actor2 = Actor.create!(name: "Meryl Streep", age: "68")
    @actor3 = Actor.create!(name: "Brad Pitt", age: "53")

    @movie1 = Movie.create!(title: "Jaws", creation_year: "1980", genre: "horror", studio_id: @studio1.id)
    @movie2 = Movie.create!(title: "Space Jam", creation_year: "1995", genre: "family", studio_id: @studio2.id)
    @movie3 = Movie.create!(title: "Toy Story", creation_year: "1993", genre: "cartoon", studio_id: @studio3.id)

    @actor_movie1 = ActorMovies.create!(actor_id: @actor1.id, movie_id: @movie3)
    @actor_movie1 = ActorMovies.create!(actor_id: @actor2.id, movie_id: @movie1)
    @actor_movie1 = ActorMovies.create!(actor_id: @actor3.id, movie_id: @movie2)
    @actor_movie1 = ActorMovies.create!(actor_id: @actor3.id, movie_id: @movie3)

    @studio1 = Studio.create!(name: "Universal", location: "Hollywood")
    @studio2 = Studio.create!(name: "MGM", location: "Chicago")
    @studio3 = Studio.create!(name: "Disney", location: "Orlando")
  end

  it 'display all studios with name and locations' do
    visit "/studios"

    expect(page).to have_content(@studio1.name)
    expect(page).to have_content(@studio1.location)
    expect(page).to have_content(@studio1.movies.title)
    expect(page).to have_content(@studio1.movies.creation_year)
    expect(page).to have_content(@studio1.movies.genre)
  end
end