require "rails_helper"

RSpec.describe "Studio's Index page", type: :feature do

  #   Story 1 - Studio Index

# As a user,
# When I visit the studio index page,
# Then I see all of the studios including name and location,
# And under each studio I see all of the studio's movies
# including the movie's title, creation year, and genre
  describe "when I vist the studio index page" do
    let!(:studio_1) { Studio.create!(name:"Paramount", location: "Los Angeles") }
    let!(:studio_2) { Studio.create!(name:"Universal", location: "Burbank") }
    let!(:movie_1) { studio_1.movies.create!(title:"Billy Madison", creation_year: "1994", genre:"Comedy") }
    let!(:movie_2) { studio_1.movies.create!(title:"Happy Gilmore", creation_year: "1995", genre:"Comedy") }
    let!(:movie_3) { studio_2.movies.create!(title:"Liar, Liar", creation_year: "1997", genre:"Dramaedy") }

    it "displays all the studio's names and locations" do 
      visit "/studios"
      expect(page).to have_content(studio_1.name)
      expect(page).to have_content(studio_1.location)
      expect(page).to have_content(studio_2.name)
      expect(page).to have_content(studio_2.location)
    end

    it "displays under studios, all studio's movies, including their title, creation year, genre" do
      visit "/studios"
      # save_and_open_page
      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_2.creation_year)
      expect(page).to have_content(movie_3.genre)

    end
  end
end