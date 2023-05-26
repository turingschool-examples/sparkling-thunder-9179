require "rails_helper"

RSpec.describe "Movies Show Page" do
  before(:each) do
    @studio_1 = Studio.create!(name: "Disney", location: "Burbank, CA")

    @movie_1 = @studio_1.movies.create!(title: "The Lion King", creation_year: "1994", genre: "Childrens")
    @movie_2 = @studio_1.movies.create!(title: "Star Wars", creation_year: "1972", genre: "Science Fiction")

    @actor_1 = Actor.create!(name: "James Earl Jones", age: 70)
    @actor_2 = Actor.create!(name: "Jeremy Irons", age: 50)
    @actor_3 = Actor.create!(name: "Harrison Ford", age: 50)
    @actor_4 = Actor.create!(name: "Mark Hamill", age: 20)
    @actor_5 = Actor.create!(name: "Carrie Fisher", age: 30)

    MovieActor.create!(movie: @movie_1, actor: @actor_1)
    MovieActor.create!(movie: @movie_1, actor: @actor_2)

    MovieActor.create!(movie: @movie_2, actor: @actor_3)
    MovieActor.create!(movie: @movie_2, actor: @actor_4)
    MovieActor.create!(movie: @movie_2, actor: @actor_5)
  end

  it "displays the movie's title, creation year, and genre" do
    visit "/movies/#{@movie_1.id}"

    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_1.creation_year)
    expect(page).to have_content(@movie_1.genre)

    expect(page).to_not have_content(@movie_2.title)

    visit "/movies/#{@movie_2.id}"

    expect(page).to have_content(@movie_2.title)
    expect(page).to have_content(@movie_2.creation_year)
    expect(page).to have_content(@movie_2.genre)

    expect(page).to_not have_content(@movie_1.title)
  end

  it "displays a list of the movie's actors from youngest to oldest" do
    visit "/movies/#{@movie_1.id}"

    expect(@actor_2.name).to appear_before(@actor_1.name)

    visit "/movies/#{@movie_2.id}"

    expect(@actor_4.name).to appear_before(@actor_5.name)
    expect(@actor_5.name).to appear_before(@actor_3.name)
    expect(@actor_3.name).to_not appear_before(@actor_4.name)
  end

  it "displays the average age of the movie's actors" do
    visit "/movies/#{@movie_1.id}"
    expect(page).to have_content("Average age of Actors: 60")

    visit "/movies/#{@movie_2.id}"
    expect(page).to have_content("Average age of Actors: 33")
  end
end