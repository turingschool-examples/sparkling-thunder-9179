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
      expect(page).to have_content(movie_2.title)
      expect(page).to have_content(movie_3.creation_year)
    end

    it "displays list of all the actors from youngest to oldest" do
      visit "/movies/#{movie_1.id}"
      save_and_open_page
      expect(page).to have_content(actor_1.name)
      expect(page).to have_content(actor_2.name)
    end
  end
end