require "rails_helper"

RSpec.describe "the movie show page", type: :feature do
  let!(:studio_1) { Studio.create!(name: "Miramax", location: "LA") }
  let!(:movie_1) { studio_1.movies.create!(title: "Jaws", creation_year: 1980, genre: "horror") }
  let!(:actor_1) { Actor.create!(name: "Richard Dreyfulss", age: 32) }
  let!(:actor_2) { Actor.create!(name: "Roy Scheider", age: 35) }
  
  before(:each) do
    MovieActor.create!(movie_id: movie_1.id, actor_id: actor_1.id)
    MovieActor.create!(movie_id: movie_1.id, actor_id: actor_2.id)
  end
    # Story 2 - Movie Show
  # As a user,
  # When I visit a movie's show page.
  # I see the movie's title, creation year, and genre,
  # and a list of all its actors from youngest to oldest.
  # And I see the average age of all of the movie's actors
  
  it "lists a movie and its attributes" do
    visit "/movies/#{movie_1.id}"
    save_and_open_page
  
    expect(page).to have_content("Jaws")
    expect(page).to have_content(1980)
    expect(page).to have_content("horror")
  
    # Verify the list of actors from youngest to oldest

    expect(page).to have_content("Roy Scheider")
    expect(page).to have_content("Richard Dreyfulss")

    # Verify the average age of the movie's actors
    expect(page).to have_content("Average Age: 33.5")
  end
end
