require "rails_helper"

RSpec.describe "Movies show page", type: :feature do
#   Story 2 - Movie Show

# As a user,
# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors
  describe "when I visit a movie's show page" do
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

    it "displays the movie's title, creation year, and genre" do
      visit "/movies/#{movie_1.id}"
      expect(page).to have_content(movie_1.genre)
      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_1.creation_year)
    end

    it "displays list of all the actors from youngest to oldest" do
      visit "/movies/#{movie_1.id}"
      # save_and_open_page
      expect(page).to have_content(actor_1.name)
      expect(page).to have_content(actor_2.name)
    end

    #Story 3
# Add an Actor to a Movie

# As a user,
# When I visit a movie show page,
# I do not see any actors listed that are not part of the movie
# And I see a form to add an actor to this movie
# When I fill in the form with the ID of an actor that exists in the database
# And I click submit
# Then I am redirected back to that movie's show page
# And I see the actor's name is now listed
# (You do not have to test for a sad path, for example if the id submitted is not an existing actor)
    it "doesn't display actors who aren't part of the movie" do
      visit "/movies/#{movie_1.id}"
      # save_and_open_page
      expect(page).to_not have_content(actor_3.name)
      expect(page).to_not have_content(actor_4.name)
      expect(page).to_not have_content(actor_5.name)
      expect(page).to_not have_content(actor_6.name)
      expect(page).to have_content(actor_2.name)
    end

    it "displays a form to add an actor to the movie" do
      visit "/movies/#{movie_1.id}"
      save_and_open_page
      expect(page).to have_content("Actor")
      expect(page).to have_button("Add Actor")
    end

    it "fill form with id that exists, click submit, redirect back to show page" do
      visit "/movies/#{movie_1.id}"
      fill_in "actor_id", with: actor_2.id

      click_button "Add Actor"
      expect(current_path).to eq("/movies/#{movie_1.id}")

    end
  end
end