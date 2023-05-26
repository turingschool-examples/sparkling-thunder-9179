require "rails_helper"

RSpec.describe "the studio index page" do
# Story 1 - Studio Index
  it "I see all of the studios including name and location, and under each studio I see all of the studio's movie attributes" do
    studio1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
    studio2 = Studio.create!(name: "Disney", location: "Disneyland")
    movie1 = studio1.movies.create!(title: "A Movie", creation_year: "2023", genre: "comedy")
    movie2 = studio1.movies.create!(title: "B Movie", creation_year: "2013", genre: "horror")
    movie3 = studio2.movies.create!(title: "C Movie", creation_year: "2022", genre: "animation")
    movie4 = studio2.movies.create!(title: "D Movie", creation_year: "2012", genre: "family")

    visit "/studios"
save_and_open_page
    expect(page).to have_content(studio1.name)
    expect(page).to have_content(studio1.location)
    expect(page).to have_content(studio2.name)
    expect(page).to have_content(studio2.location)

    within "#stud-#{studio1.id}" do
      expect(page).to have_content(movie1.title)
      expect(page).to have_content(movie1.creation_year)
      expect(page).to have_content(movie1.genre)
      expect(page).to have_content(movie2.title)
      expect(page).to have_content(movie2.creation_year)
      expect(page).to have_content(movie2.genre)
      expect(page).to_not have_content(movie3.title)
      expect(page).to_not have_content(movie3.creation_year)
      expect(page).to_not have_content(movie3.genre)
      expect(page).to_not have_content(movie4.title)
      expect(page).to_not have_content(movie4.creation_year)
      expect(page).to_not have_content(movie4.genre)
    end

    within "#stud-#{studio2.id}" do
      expect(page).to have_content(movie3.title)
      expect(page).to have_content(movie3.creation_year)
      expect(page).to have_content(movie3.genre)
      expect(page).to have_content(movie4.title)
      expect(page).to have_content(movie4.creation_year)
      expect(page).to have_content(movie4.genre)
      expect(page).to_not have_content(movie1.title)
      expect(page).to_not have_content(movie1.creation_year)
      expect(page).to_not have_content(movie1.genre)
      expect(page).to_not have_content(movie2.title)
      expect(page).to_not have_content(movie2.creation_year)
      expect(page).to_not have_content(movie2.genre)
    end
  end
end
