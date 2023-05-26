require "rails_helper"

RSpec.describe "Movie Show Page", type: :feature do

  let!(:studio) { Studio.create!(name: "Universal Studios", location: "Hollywood") }
  let!(:movie) { studio.movies.create!(title: "Jurassic World", creation_year: "2015", genre: "Sci-Fi") }
  let!(:actor_1) { movie.actors.create!(name: "Chris Pratt", age: 42) }
  let!(:actor_2) { movie.actors.create!(name: "Bryce Dallas Howard", age: 40) }
  let!(:actor_3) { movie.actors.create!(name: "Jeff Goldblum", age: 69) }

  describe "As a user, when I visit the Movie's Show Page" do
    it "will display all the movie's title, creation year and genre" do
      visit "/movies/#{movie.id}"

      expect(page).to have_content("Title: #{movie.title}")
      expect(page).to have_content("Creation Year: #{movie.creation_year}")
      expect(page).to have_content("Genre: #{movie.genre}")
    end

    it "will display all actors from youngest to oldest" do
      visit "/movies/#{movie.id}"
      within "#actors-age" do
        expect(page).to have_content("Actors (Youngest to Oldest)")
        expect(actor_2.name).to appear_before(actor_1.name)
        expect(actor_2.name).to appear_before(actor_3.name)
        expect(actor_1.name).to appear_before(actor_3.name)
      end
    end

    it "will display the average age of the movie's actors" do
      visit "/movies/#{movie.id}"

      within "#actors-age" do
        expect(page).to have_content("Average Age of Actors: 50.33")
      end
    end
  end
end