require "rails_helper"

RSpec.describe "movie show page" do
  it "can display movie details" do
    # As a user,
    # When I visit a movie's show page.
    # I see the movie's title, creation year, and genre,
    # and a list of all its actors from youngest to oldest.
    # And I see the average age of all of the movie's actors
    studio_1 = Studio.create!(name: "LucasArts", location: "LA")
    movie_1 = studio_1.movies.create!(title: "StarWars", creation_year: "1977", genre: "Scifi")
    actor_1 = movie_1.actors.create!(name: "Mark Hamil", age: 26)
    actor_2 = movie_1.actors.create!(name: "Harrison Ford", age: 35)
    actor_3 = movie_1.actors.create!(name: "Carrie Fisher", age: 21)
    visit "movies/#{movie_1.id}"

    expect(page).to have_content("Movie: StarWars")
    expect(page).to have_content("Year: 1977")
    expect(page).to have_content("Genre: Scifi")
     
    expect(page).to have_content("Carrie Fisher, 21")
    expect(page).to have_content("Mark Hamil, 26")
    expect(page).to have_content("Harrison Ford, 35")

    expect("Carrie Fisher, 21").to appear_before("Mark Hamil, 26", only_text: true)
    expect("Carrie Fisher, 21").to appear_before("Harrison Ford, 35", only_text: true)
    expect("Harrison Ford, 35").to_not appear_before("Carrie Fisher, 21", only_text: true)
    expect(page).to have_content("Average Age: 27.33")
  end
end