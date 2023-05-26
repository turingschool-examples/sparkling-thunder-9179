require "rails_helper"

RSpec.describe "Studio Index" do
  let!(:studio) { Studio.create!(name: "Universal Studios", location: "Hollywood")}
  let!(:studio2) { Studio.create!(name: "Fox Studios", location: "Los Angeles")}
  let!(:movie1) { studio.movies.create!(title: "Toy Story", creation_year: "1995", genre: "animation")}
  let!(:movie2) { studio2.movies.create!(title: "Ice Age", creation_year: "2002", genre: "animation")}


  describe "/studios" do
    it "should display all of the studios including name and location" do
      visit "/studios"

      expect(page).to have_content(studio.name)
      expect(page).to have_content(studio.location)
      expect(page).to have_content(studio2.name)
      expect(page).to have_content(studio2.location)
    end

    it "should display all studio movies including the movie's title, creation year, and genre." do
      visit "/studios"

      expect(page).to have_content(movie1.title)
      expect(page).to have_content(movie1.creation_year)
      expect(page).to have_content(movie1.genre)
    end
  end
end