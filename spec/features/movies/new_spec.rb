require "rails_helper"
  RSpec.describe "Add actors" do
  it "can add actor to movie" do
    # As a user,
    # When I visit a movie show page,
    # I do not see any actors listed that are not part of the movie
    # And I see a form to add an actor to this movie
    # When I fill in the form with the ID of an actor that exists in the database
    # And I click submit
    # Then I am redirected back to that movie's show page
    # And I see the actor's name is now listed
    # (You do not have to test for a sad path, for example if the id submitted is not an existing actor)
    studio_1 = Studio.create!(name: "LucasArts", location: "LA")
    movie_1 = studio_1.movies.create!(title: "StarWars", creation_year: "1977", genre: "Scifi")
    actor_1 = movie_1.actors.create!(name: "Mark Hamil", age: 26)
    actor_2 = movie_1.actors.create!(name: "Harrison Ford", age: 35)
    visit "movies/#{movie_1.id}"

    expect(page).to_not have_content("Carrie Fisher, 21")
    fill_in("name", with: "Carrie Fisher")
    fill_in("age", with: 21)

    click_button("Add Actor")

    expect(page).to have_content("Carrie Fisher, 21")
  end
end