require "rails_helper"

RSpec.describe "Studio index" do
  let!(:studio1) { Studio.create!(name: "Warner Bros", location: "LA") }
  let!(:studio2) { Studio.create!(name: "MoviesINC", location: "DC") }

  let!(:movie1) { studio1.movies.create!(title: "Batman", creation_year: "2008", genre: "Action") }
  let!(:movie2) { studio2.movies.create!(title: "Spongebob", creation_year: "2022", genre: "Comedy") }

  describe "List of all studios" do
    it "sees all of the studios including name and location" do
      visit "/studios"
      expect(page).to have_content("Studios Index")

      expect(page).to have_content(studio1.name)
      expect(page).to have_content(studio1.location)
      expect(page).to have_content(studio2.name)
      expect(page).to have_content(studio2.location)
    end

    it "sees all movies associated with studio" do
      visit "/studios"
      expect(page).to have_content("Movies by Studio")
      
      expect(page).to have_content(movie1.title)
      expect(page).to have_content(movie1.creation_year)
      expect(page).to have_content(movie1.genre)
      
      expect(page).to have_content(movie2.title)
      expect(page).to have_content(movie2.creation_year)
      expect(page).to have_content(movie2.genre)
    end
  end
end
