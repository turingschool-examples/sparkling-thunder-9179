require "rails_helper"

RSpec.describe "/studios" do 
  describe "as a visitor" do 
    it "has all studios name and location" do 
      uni = Studio.create!(name: "Universal Studios", location: "Hollywood")
      wb = Studio.create!(name: "Warner Brothers", location: "Burbank")
      visit "/studios"

      expect(page).to have_content(uni.name)
      expect(page).to have_content(uni.location)
      expect(page).to have_content(wb.name)
      expect(page).to have_content(wb.location)

    end
  end

    it "shows all the studios movies including title,creation year, and genre" do 
      uni = Studio.create!(name: "Universal Studios", location: "Hollywood")
      wb = Studio.create!(name: "Warner Brothers", location: "Burbank")
      ddarko = uni.movies.create!(title: "Donnie Darko", creation_year: "2000", genre: "Sci-Fi")
      tdrifter = uni.movies.create!(title: "Tokyo Drifter", creation_year: "1966", genre: "Action")
      eight = wb.movies.create!(title: "8 1/2", creation_year: "1963", genre: "Fantasy")
      jodirt = wb.movies.create!(title: "Joe Dirt", creation_year: "2000", genre: "Comedy")
      visit "/studios"

      
      expect(page).to have_content(ddarko.title)
      expect(page).to have_content(ddarko.creation_year)
      expect(page).to have_content(ddarko.genre)
      expect(page).to have_content(tdrifter.title)
      expect(page).to have_content(tdrifter.creation_year)
      expect(page).to have_content(tdrifter.genre)
      expect(page).to have_content(eight.title)
      expect(page).to have_content(eight.creation_year)
      expect(page).to have_content(eight.genre)
      expect(page).to have_content(jodirt.title)
      expect(page).to have_content(jodirt.creation_year)
      expect(page).to have_content(jodirt.genre)

    end
end