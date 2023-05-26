require "rails_helper"

RSpec.describe "Studio Index Page" do
  let!(:studio_1) { Studio.create!(name: "Universal Studios", location: "Hollywood")}
  let!(:studio_2) { Studio.create!(name: "Paramount Pictures", location: "Hollywood")}
  let!(:studio_3) { Studio.create!(name: "Disney", location: "Burbank")}

  let!(:movie_1) { studio_1.movies.create!(title: "Jurassic World", creation_year: "2015", genre: "Sci-Fi")}
  let!(:movie_2) { studio_1.movies.create!(title: "The Mummy", creation_year: "1999", genre: "Action")}
  let!(:movie_3) { studio_2.movies.create!(title: "Wayne's World", creation_year: "1992", genre: "Comedy")}
  let!(:movie_4) { studio_2.movies.create!(title: "Paranormal Activity", creation_year: "2007", genre: "Horror")}
  let!(:movie_5) { studio_3.movies.create!(title: "Toy Story", creation_year: "1995", genre: "Animation")}

  describe "As a visitor, when I visit the studio index page" do
    it "displays the studio and it's attributes" do
      visit "/studios"
      expect(page).to have_content("Name: #{studio_1.name}")
      expect(page).to have_content("Location: #{studio_1.location}")

      expect(page).to have_content("Name: #{studio_2.name}")
      expect(page).to have_content("Location: #{studio_2.location}")

      expect(page).to have_content("Name: #{studio_3.name}")
      expect(page).to have_content("Location: #{studio_3.location}")
    end
    it "displays each studio's movies including movie attributes" do
      visit "/studios"

      within "#studio-#{studio_1.id}" do
        expect(page).to have_content(movie_1.title)
        expect(page).to have_content(movie_1.creation_year)
        expect(page).to have_content(movie_1.genre)
    
        expect(page).to have_content(movie_2.title)
        expect(page).to have_content(movie_2.creation_year)
        expect(page).to have_content(movie_2.genre)
      end

      within "#studio-#{studio_2.id}" do
        expect(page).to have_content(movie_3.title)
        expect(page).to have_content(movie_3.creation_year)
        expect(page).to have_content(movie_3.genre)
    
        expect(page).to have_content(movie_4.title)
        expect(page).to have_content(movie_4.creation_year)
        expect(page).to have_content(movie_4.genre)
      end

      within "#studio-#{studio_3.id}" do
        expect(page).to have_content(movie_5.title)
        expect(page).to have_content(movie_5.creation_year)
        expect(page).to have_content(movie_5.genre)
      end
    end
  end
end