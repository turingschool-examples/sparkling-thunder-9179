require "rails_helper"

RSpec.describe "Studio index" do
  let!(:studio1) { Studio.create!(name: "Warner Bros", location: "LA") }
  let!(:studio2) { Studio.create!(name: "MoviesINC", location: "DC") }

  # let!(:movie1) { Movie.create!(title: "Batman", creation_year: "2008", genre: "Action") }
  # let!(:movie2) { Movie.create!(title: "Spongebob", creation_year: "2022", genre: "Comedy") }

  describe "List of all studios" do
    it "sees all of the studios including name and location" do
      visit "/studios"
      expect(page).to have_content("Studios Index")

      expect(page).to have_content(studio1.name)
      expect(page).to have_content(studio1.location)
      expect(page).to have_content(studio2.name)
      expect(page).to have_content(studio2.location)


    end
  end
end
