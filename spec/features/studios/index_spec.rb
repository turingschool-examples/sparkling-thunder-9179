require "rails_helper"

RSpec.describe "Studio index" do
  it "can display studios" do
    # As a user,
    # When I visit the studio index page,
    # Then I see all of the studios including name and location,
    # And under each studio I see all of the studio's movies
    # including the movie's title, creation year, and genre
    studio_1 = Studio.create!(name: "LucasArts", location: "LA")
    movie_1 = studio_1.movies.create!(title: "StarWars", creation_year: "1987", genre: "Scifi")
    actor_1 = movie_1.actors.create!(name: "Mark Hamil", age: 28)
    actor_2 = movie_1.actors.create!(name: "Harrison Ford", age: 34)
    actor_3 = movie_1.actors.create!(name: "Carrie Fisher", age: 28)
    visit "studios"

    expect(page).to have_content("Studio: LucasArts")
    expect(page).to have_content("Location: LA")
    expect(page).to have_content("Movies: StarWars, 1987, Scifi")

  end
end